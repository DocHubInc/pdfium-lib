# Build for WASM

1. Execute all **general** steps

2. Get Emscripten SDK:
   `python3 make.py build-emsdk`

3. Get PDFium:
   `python3 make.py build-pdfium-wasm`

4. Patch:
   `python3 make.py patch-wasm`

5. PDFium Linux dependencies
   `./build/wasm32/pdfium/build/install-build-deps.sh`

6. Compile:
   `python3 make.py build-wasm`

7. Install libraries:
   `python3 make.py install-wasm`

8. Test:
   `python3 make.py test-wasm`

9. Generate javascript libraries:
   `python3 make.py generate-wasm`

Obs:

- The file **make.py** need be executed with python version 3.
- You need run all steps in a Linux machine (real, vm or docker) to it works.
- With docker you can skip steps 2 and 3.

## Docker

You can use docker to build and test on local machine before deploy.

Build the image with command:

`docker build -t pdfium-wasm -f docker/wasm/Dockerfile docker/wasm`

Test with command:

`docker run -v ${PWD}:/app -it pdfium-wasm echo "test"`

Now you can execute any command with pattern:

`docker run -v ${PWD}:/app -it pdfium-wasm [COMMAND]`

To build pdfium to WASM using this Docker container, the following steps are necessary:

1. `docker run -v ${PWD}:/app -it pdfium-wasm /bin/bash`

1. Install PIP requirements:
   `python3 -m pip install -r requirements.txt`

1. Create symlink to pdfium source in build directory:
   `mkdir build && ln -s /build ./build/wasm32/` (as this is modifying the local repo, it is not needed on subsequent runs)

1. Patch:
   `python3 make.py patch-wasm`

1. Compile:
   `python3 make.py build-wasm`

1. Install libraries:
   `python3 make.py install-wasm`

1. Test:
   `python3 make.py test-wasm`

1. Generate javascript libraries:
   `python3 make.py generate-wasm`

The `pdfium.wasm` and `pdfium.js` files will be placed in the `build/wasm32/wasm/release/node` directory.

## Run on browser

You can test the sample using commands:

````

python3 make.py test-wasm
python3 -m http.server --directory sample-wasm/build

```

or with docker you can use:

```

docker run -v ${PWD}:/app -it pdfium-wasm python3 make.py test-wasm
python3 -m http.server --directory sample-wasm/build

```

## Run on terminal

You can test the sample using commands:

```

python3 make.py test-wasm
node sample-wasm/build/index.js

```

or with docker you can use:

```

docker run -v ${PWD}:/app -it pdfium-wasm python3 make.py test-wasm
docker run -v ${PWD}:/app -it pdfium-wasm node sample-wasm/build/index.js

```

## Web demo

You can test pdfium on web browser here:

https://pdfviewer.github.io/
```
````

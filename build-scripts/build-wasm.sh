#! /bin/bash

set -ex

python3 -m pip install -r requirements.txt
if [ ! -d "./build/wasm32" ]; then
    mkdir build && ln -s /build ./build/wasm32
fi
python3 make.py patch-wasm
python3 make.py build-wasm
python3 make.py install-wasm
python3 make.py test-wasm
python3 make.py generate-wasm

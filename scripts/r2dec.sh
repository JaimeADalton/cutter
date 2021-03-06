#!/bin/bash

set -e

SCRIPTPATH=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

cd "$SCRIPTPATH/.."

if [[ ! -d r2dec-js ]]; then
	git clone https://github.com/rizinorg/r2dec-js.git --depth 1 --branch master
	#cd r2dec-js
	#git checkout b5a0d15c7bcc488f268ffb0931b7ced2919f6c9d
	#cd ..
fi

cd r2dec-js
rm -rf build
mkdir build && cd build
meson --buildtype=release --libdir=share/rizin/plugins --datadir=share/rizin/plugins "$@" ../p
ninja
ninja install


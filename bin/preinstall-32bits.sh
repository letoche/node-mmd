#!/usr/bin/env bash

node-gyp configure --arch=ia32
mkdir -p deps
cd deps
#curl -L https://github.com/fletcher/Multimarkdown-4/tarball/4.4.2 | tar zxvf -
#mv fletcher* MultiMarkdown-4
git clone https://github.com/fletcher/MultiMarkdown-4.git
cd MultiMarkdown-4
git submodule init
git submodule update
cd greg
#sidestep a build err that occurs with greg sometimes
#(see fletcher notes on building MMD)
touch greg.c
# build Multimarkdown-4
CFLAGS=-'m32 -Wall -g -O3 -include GLibFacade.h'
export CFLAGS
XFLAGS='-m32'
export XFLAGS
cd .. && make

cd ../../ && node-gyp build

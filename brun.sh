#!/bin/zsh
set -e

bsc -sim -u ./test/Tb.bsv
#bsc -sim -e $1
# turn off "warning: 'sprintf' is deprecated"
bsc -Xc++ -Wno-deprecated-declarations -sim -e $1
shift
./bsim $@

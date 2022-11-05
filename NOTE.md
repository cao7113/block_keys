## recompile

mix clean --deps && mix compile

brew install autoconf automake libtool
brew install gmp

22.3.4.26
https://github.com/RiverFinancial/bitcoinex/issues/13
work on otp-22?
not work!!!

https://github.com/ethereum/go-ethereum/issues/1617

## try on Ubuntu 20.04.4 LTS

sudo apt-get install autoconf automake libtool build-essentials

automake libtool inotify-tools autoconf

https://github.com/ethereum/go-ethereum/issues/1617
sudo apt-get install libgmp3-dev
works!!!

mix clean --deps && mix compile

## macos

#include <gmp.h>
         ^~~~~~~
1 error generated.
make: *** [priv/libsecp256k1_nif.so] Error 1
==> libsecp256k1
warning: Mix compiler :make_bindings was supposed to return {:ok | :noop | :error, [diagnostic]} but it returned :error
Compiling 1 file (.erl)
src/libsecp256k1.erl:146:1: Warning: function not_loaded/1 is unused
%  146| not_loaded(Line) ->
%     | ^

Generated libsecp256k1 app



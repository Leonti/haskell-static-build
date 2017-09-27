#!/usr/bin/env bash

set -feuo pipefail
IFS=$'\n\t'

if [ $# -eq 1 ] && ([ "$1" == '--help' ] || [ "$1" == '-h' ]); then
  echo "Example:" \
       "docker run" \
       "-v \"\$(pwd):/src\"" \
       "leonti/haskell-static-build"
  exit 1
fi

echo "Building static binary"
stack setup --allow-different-user "$(ghc --numeric-version)" --skip-ghc-check
stack build --allow-different-user --ghc-options "-optl-static -fPIC -optc-Os" -- .

# Strip all statically linked executables
find "$(stack path --allow-different-user --dist-dir)/build" \
  -type f \
  -perm -u=x,g=x,o=x \
  -exec strip --strip-all --enable-deterministic-archives --preserve-dates {} +

#ln -snf -- "$(stack path --dist-dir)/build"
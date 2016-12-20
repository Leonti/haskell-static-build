#!/usr/bin/env bash

set -feuo pipefail
IFS=$'\n\t'

if [ $# -eq 0 ] || [ "$1" == '--help' ] || [ "$1" == '-h' ]; then
  echo "Example:" \
       "docker run" \
       "-v \"\$(pwd):/src\"" \
       "leonti/haskell-static-build"
  exit 1
fi

ghc_options=${ghc_options:--static -optl-static -optl-pthread}

echo "Building static binary"
stack setup "$(ghc --numeric-version)" --skip-ghc-check
stack build --ghc-options "$ghc_options" -- .

# Strip all statically linked executables
find "$(stack path --dist-dir)/build" \
  -type f \
  -perm -u=x,g=x,o=x \
  -exec strip --strip-all --enable-deterministic-archives --preserve-dates {} +

#ln -snf -- "$(stack path --dist-dir)/build"

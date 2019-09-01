#{ ghc }:
with (import <nixpkgs> {});

let
  libs = [
#    gmp
#    libffi
#    ncurses
#    perl
#    zlib
  ];

in haskell.lib.buildStackProject {
  name = "env";
  inherit ghc;
  buildInputs = libs;
#  name = "env";
#  src = if lib.inNixShell then null else ./.;
}

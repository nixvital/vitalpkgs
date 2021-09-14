{ callPackage, writeShellScriptBin, clang }:
let 
  cli = callPackage ./python-warp.nix {};
in 
  writeShellScriptBin "vscode-include-fix" ''
    ${cli}/bin/vscode-include-fix cpp-json --clang ${clang}/bin/clang
  ''

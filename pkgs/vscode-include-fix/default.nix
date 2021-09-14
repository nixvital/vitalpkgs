{ python38Packages, writeShellScriptBin, llvmPackages_11 }:
let 
  cli = python38Packages.callPackage ./python-warp.nix {};
in 
  writeShellScriptBin "vscode-include-fix" ''
    ${cli}/bin/vscode-include-fix cpp-json --clang ${llvmPackages_11.clang}/bin/clang
  ''

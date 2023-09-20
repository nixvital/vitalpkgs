{ python38Packages, writeShellScriptBin, llvmPackages_11,llvmPackages_16 }:
let 
  cli = python38Packages.callPackage ./python-warp.nix {};
in 
  writeShellScriptBin "vscode-include-fix" ''
    if [ "$1" = "-v" ] && [ "$2" = "11" ]; then
      clang_path=${llvmPackages_11.clang}/bin/clang
    else
      clang_path=${llvmPackages_16.clang}/bin/clang
    ${cli}/bin/vscode-include-fix cpp-json --clang ${llvmPackages_11.clang}/bin/clang
  ''

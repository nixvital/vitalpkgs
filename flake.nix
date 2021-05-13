{
  description = ''
    Provides a list of packages that is not in nixpkgs (yet).

    They are exposed as both individual packages as well as an overlay.
  '';

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {self, nixpkgs, flake-utils, ... }:

    let supportedLinuxSystems = [ "x86_64-linux" "i686-linux" "aarch64-linux" ];

    in {
      inherit supportedLinuxSystems;
      overlay = final: prev: {
        popl = final.callPackage ./pkgs/popl {};
        nlohmann_json = final.callPackage ./pkgs/nlohmann_json {};
        clickhouse-cpp = final.callPackage ./pkgs/clickhouse-cpp {};
        ethminer = final.callPackage ./pkgs/ethminer {};
        python3 = prev.python3.override {
          packageOverrides = python-final: python-prev: {
            blspy = python-final.callPackage ./pkgs/chia/blspy {};
            chiavdf = python-final.callPackage ./pkgs/chia/chiavdf {};
            chiabip158 = python-final.callPackage ./pkgs/chia/chiabip158 {};
            chiapos = python-final.callPackage ./pkgs/chia/chiapos {};
            clvm = python-final.callPackage ./pkgs/chia/clvm {};
            chiafan-workforce = python-final.callPackage ./pkgs/chiafan-workforce {};
          };
        };
      };
    } // flake-utils.lib.eachSystem supportedLinuxSystems
      (system: let pkgs = import nixpkgs {
                     inherit system;
                     overlays = [ self.overlay ];
                     config.allowUnfree = true;
                   };

                   customizedPython = pkgs.python3.withPackages (python-packages: with python-packages; [
                     blspy chiabip158 chiavdf chiapos clvm
                   ]);
               in {
                 packages = {
                   inherit (pkgs) popl nlohmann_json clickhouse-cpp ethminer;
                 };

                 devShell = pkgs.mkShell rec {
                   name = "vitalpkgs";
                   buildInputs = with pkgs; [
                     python3Packages.chiafan-workforce
                     popl nlohmann_json clickhouse-cpp
                     customizedPython
                   ];
                 };
               });
}

{
  description = ''
    Provides a list of packages that is not in nixpkgs (yet).

    They are exposed as both individual packages as well as an overlay.
  '';

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs?rev=f924460e91cba6473c5dc4b8ccb1a1cfc05bc2d7";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {self, nixpkgs, nixpkgs-unstable, flake-utils, ... }:

    let supportedLinuxSystems = [ "x86_64-linux" "i686-linux" "aarch64-linux" ];

    in {
      inherit supportedLinuxSystems;
      overlay = final: prev: {
        popl = final.callPackage ./pkgs/popl {};
        nlohmann_json = final.callPackage ./pkgs/nlohmann_json {};
        clickhouse-cpp = final.callPackage ./pkgs/clickhouse-cpp {};
        highwayhash = final.callPackage ./pkgs/highwayhash {};
        avro-cpp = final.callPackage ./pkgs/avro-cpp {};  # Updated with my CMake packaging patch
        civetweb = final.callPackage ./pkgs/civetweb {};
        chia = nixpkgs-unstable.legacyPackages.chia;
        python3 = prev.python3.override {
          packageOverrides = python-final: python-prev: {
            chiafan-workforce = python-final.callPackage ./pkgs/chiafan-workforce {};
            chiafan-monitor = python-final.callPackage ./pkgs/chiafan-monitor {};
          };
        };
      };
    } // flake-utils.lib.eachSystem supportedLinuxSystems
      (system: let pkgs = import nixpkgs {
                     inherit system;
                     overlays = [ self.overlay ];
                     config.allowUnfree = true;
                   };
               in {
                 packages = {
                   inherit (pkgs) popl nlohmann_json clickhouse-cpp ethminer highwayhash avro-cpp;
                   chiafan-workforce = pkgs.python3Packages.chiafan-workforce;
                   chiafan-monitor = pkgs.python3Packages.chiafan-monitor;
                   civetweb = pkgs.civetweb;
                 };

                 devShell = pkgs.mkShell rec {
                   name = "vitalpkgs";
                   buildInputs = with pkgs; [
                     popl nlohmann_json clickhouse-cpp highwayhash
                     python3Packages.chiafan-workforce
                     python3Packages.chiafan-monitor
                     chia
                   ];
                 };
               });
}

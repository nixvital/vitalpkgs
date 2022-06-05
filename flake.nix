{
  description = ''
    Provides a list of packages that is not in nixpkgs (yet).

    They are exposed as both individual packages as well as an overlay.
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {self, nixpkgs, flake-utils, ... }:

    let supportedLinuxSystems = [ "x86_64-linux" "i686-linux" "aarch64-linux" ];

    in {
      inherit supportedLinuxSystems;
      overlay = final: prev: {
        popl = final.callPackage ./pkgs/popl {};
        clickhouse-cpp = final.callPackage ./pkgs/clickhouse-cpp {};
        highwayhash = final.callPackage ./pkgs/highwayhash {};
        avro-cpp = final.callPackage ./pkgs/avro-cpp {};  # Updated with my CMake packaging patch
        redis-plus-plus = final.callPackage ./pkgs/redis-plus-plus {};
        influxdb-cxx = final.callPackage ./pkgs/influxdb-cxx {};
        hiredis = final.callPackage ./pkgs/hiredis {};
        civetweb = final.callPackage ./pkgs/civetweb {};
        vscode-include-fix = final.callPackage ./pkgs/vscode-include-fix {};
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
                   civetweb = pkgs.civetweb;
                   hiredis = pkgs.hiredis;
                   redis-plus-plus = pkgs.redis-plus-plus;
                   influxdb-cxx = pkgs.influxdb-cxx;
                   vscode-include-fix = pkgs.vscode-include-fix;
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

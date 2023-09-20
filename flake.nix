{
  description = ''
    Provides a list of packages that is not in nixpkgs (yet).

    They are exposed as both individual packages as well as an overlay.
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {self, nixpkgs, flake-utils, ... }: {
    overlays.default = final: prev: {
      clickhouse-cpp = final.callPackage ./pkgs/clickhouse-cpp {};
      highwayhash = final.callPackage ./pkgs/highwayhash {};
      influxdb-cxx = final.callPackage ./pkgs/influxdb-cxx {};
      # Need this because the hiredis in nixpkgs does not handle CMake properly.
      hiredis = final.callPackage ./pkgs/hiredis {};
      # Need this because the avro-cpp in nixpkgs does not handle CMake properly.
      avro-cpp = final.callPackage ./pkgs/avro-cpp {};
      # NOTE(breakds): 22.05 already have civetweb, but it does not enable websocket.
      civetweb = final.callPackage ./pkgs/civetweb {};
      vscode-include-fix = final.python3Packages.callPackage ./pkgs/vscode-include-fix {};
      # This is to make sure that the abseil we are using is the same version as
      # the abseil used in arrow-cpp (it is actually used in grpc). However,
      # grpc actually requires "CXX_STANDARD = 14", so it is still using a
      # different one, just not too different.
      abseil-cpp = prev.abseil-cpp_202206;
    };
  } // flake-utils.lib.eachSystem [ "x86_64-linux" ]
    (system: let pkgs = import nixpkgs {
                   inherit system;
                   overlays = [ self.overlays.default ];
                   config.allowUnfree = true;
                 };
             in {
               packages = {
                 inherit (pkgs) popl nlohmann_json clickhouse-cpp highwayhash;
                 civetweb = pkgs.civetweb;
                 influxdb-cxx = pkgs.influxdb-cxx;
                 vscode-include-fix = pkgs.vscode-include-fix;
               };

               devShells.default = pkgs.mkShell rec {
                 name = "vitalpkgs";
                 buildInputs = with pkgs; [
                   clickhouse-cpp highwayhash hiredis avro-cpp vscode-include-fix
                 ];
               };
             });
}

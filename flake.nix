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
      };
    } // flake-utils.lib.eachSystem supportedLinuxSystems
      (system: let pkgs = import nixpkgs {
                     inherit system;
                     overlays = [ self.overlay ];
                   }; in {
                     packages = {
                       inherit (pkgs) popl;
                     };
                   });
}

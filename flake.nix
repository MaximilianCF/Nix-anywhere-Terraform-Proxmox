{
  description = "NixOS config para VM provisionada via nix-anywhere";

  inputs.nixpkgs.url = "nixpkgs/nixos-24.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        nixosConfigurations.vm-nix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configurations/vm-nix.nix
          ];
        };
      });
}

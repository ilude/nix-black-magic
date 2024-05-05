{
  description = "Black Magic";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      commonModules = [
        ./configuration.nix
        ./build-image.nix
      ];
    in
    {
      nixosConfigurations = {
        build-qcow2-development = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = commonModules ++ [
            ./development.nix
          ];
        };
        build-qcow2-production = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = commonModules;
        };
      };
    };
}
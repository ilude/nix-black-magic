{ config, lib, pkgs, modulesPath, ... }: {
  system.build.qcow2 = import <nixpkgs/nixos/lib/make-disk-image.nix> {
    inherit lib config pkgs;
    diskSize = 10240;
    format = "qcow2";
    partitionTableType = "hybrid";
    configFile = pkgs.writeText "configuration.nix" (pkgs.lib.readFile ./configuration.nix);
  };
}
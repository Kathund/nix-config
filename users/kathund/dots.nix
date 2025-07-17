{ config, pkgs, ... }:

{
  home = {
    username = "kathund";
    homeDirectory = "/home/kathund";
    stateVersion = "25.05";
  };

  imports = [
    ./gitconfig.nix
  ];

  programs.home-manager.enable = true;
}

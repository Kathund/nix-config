{ config, pkgs, ... }:

{
  home = {
    username = "kathund";
    homeDirectory = "/home/kathund";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}

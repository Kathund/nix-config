{ inputs, config, pkgs, ... }:

{
  users = {
    users = {
      kathund = {
        isNormalUser = true;
        description = "kathund";
        extraGroups = [ "networkmanager" "wheel" ];
	shell = pkgs.zsh;
        packages = with pkgs; [];
      };
    };
  };

  programs.zsh.enable = true;

  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      kathund = import ./dots.nix;
    };
  };
}

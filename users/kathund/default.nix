{ inputs, config, pkgs, ... }:

{
  users = {
    users = {
      kathund = {
        isNormalUser = true;
        description = "kathund";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
      };
    };
  };

  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      kathund = import ./dots.nix;
    };
  };
}

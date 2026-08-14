{
  config,
  lib,
  inputs,
  pkgs,
  username,
  ...
}:
let
  program = "hyprland";
  cfg = config.modules.desktop.${program};
in
{
  options.modules.desktop.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  imports = [
    ./autoStart.nix
    ./binds.nix
    ./decoration.nix
  ];

  config = lib.mkIf cfg.enable {
    programs."${program}" = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
    xdg.portal = {
      enable = true;
      extraPortals = [
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
      ];
    };
    environment.sessionVariables = {
      IXPKGS_ALLOW_UNFREE = "1";
      NIXOS_OZONE_WL = "1";
      XCURSOR_SIZE = "24";
    };
    home-manager.users.${username}.wayland.windowManager.${program} = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      configType = "lua";
      systemd.variables = [ "--all" ];
      settings.config = {
        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "";
          kb_rules = "";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad = {
            natural_scroll = true;
            scroll_factor = 1;
          };
        };
        master.new_status = "master";
        misc = {
          force_default_wallpaper = -1;
          disable_hyprland_logo = false;
        };
      };
    };
  };
}

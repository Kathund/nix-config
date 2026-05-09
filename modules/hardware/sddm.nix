{
  config,
  lib,
  pkgs,
  ...
}:
let
  program = "sddm";
  cfg = config.modules.hardware.${program};
in
{
  options.modules.hardware.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    fontSize = lib.mkOption {
      type = lib.types.str;
      default = "16";
    };
  };

  config = lib.mkIf cfg.enable {
    services.displayManager.${program} = {
      enable = true;
      package = lib.mkDefault pkgs.kdePackages.sddm;
      wayland.enable = true;
      theme = lib.mkIf config.modules.desktop.catppuccin.enable "catppuccin-${config.modules.desktop.catppuccin.flavor}-${config.modules.desktop.catppuccin.accent}";
    };
    environment.systemPackages = lib.mkIf config.modules.desktop.catppuccin.enable [
      (pkgs.catppuccin-sddm.override {
        inherit (config.modules.desktop.catppuccin) flavor;
        inherit (config.modules.desktop.catppuccin) accent;
        font = "JetBrainsMono Nerd Font";
        inherit (cfg) fontSize;
        loginBackground = false;
      })
    ];
  };
}

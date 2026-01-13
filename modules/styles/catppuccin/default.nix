{
  config,
  lib,
  username,
  inputs,
  ...
}:
let
  program = "catppuccin";
  cfg = config.modules.styles.${program};
in
{
  options.modules.styles.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
    flavor = lib.mkOption {
      type = lib.types.enum [
        "mocha"
        "acchiato"
        "frappe"
        "latte"
      ];
      default = "mocha";
    };
    accent = lib.mkOption {
      type = lib.types.enum [
        "blue"
        "flamingo"
        "green"
        "lavender"
        "maroon"
        "mauve"
        "peach"
        "pink"
        "red"
        "rosewater"
        "sapphire"
        "sky"
        "teal"
        "yellow"
      ];
      default = "pink";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          imports = [
            inputs.catppuccin.homeModules.catppuccin
          ];
          catppuccin = {
            enable = true;
            flavor = cfg.flavor;
            accent = cfg.accent;
          };
        };
      };
    };
  };
}

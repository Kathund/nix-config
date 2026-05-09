{
  config,
  lib,
  username,
  inputs,
  ...
}:
let
  program = "catppuccin";
  cfg = config.modules.desktop.${program};
in
{
  options.modules.desktop.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
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

  config = {
    home-manager.users.${username} = {
      imports = [ inputs.catppuccin.homeModules.catppuccin ];
      ${program} = lib.mkIf cfg.enable {
        enable = true;
        inherit (cfg) flavor;
        inherit (cfg) accent;
      };
    };
  };
}

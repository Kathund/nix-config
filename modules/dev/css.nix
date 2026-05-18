{ config, lib, ... }:
let
  program = "css";
  cfg = config.modules.dev.${program};
in
{
  options.modules.dev.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    nvf = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nvf.settings.vim = lib.mkIf cfg.nvf {
      lsp.presets.tailwindcss-language-server.enable = lib.mkIf cfg.nvf true;
      languages.scss.enable = true;
      languages.${program} = {
        enable = true;
        format.type = [ "prettier" ];
      };
    };
  };
}

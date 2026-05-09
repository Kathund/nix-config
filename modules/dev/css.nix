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
    programs.nvf.settings.vim.languages.${program} = lib.mkIf cfg.nvf {
      enable = true;
      format = {
        enable = true;
        type = [ "prettier" ];
      };
      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}

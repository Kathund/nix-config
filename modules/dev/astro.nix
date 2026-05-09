{ config, lib, ... }:
let
  program = "astro";
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
      extraDiagnostics = {
        enable = true;
        types = [ "eslint_d" ];
      };
      format = {
        enable = true;
        type = [ "prettier" ];
      };
      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}

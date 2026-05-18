{ config, lib, ... }:
let
  program = "html";
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
      extraDiagnostics.types = [ "htmlhint" ];
      format.type = [ "superhtml" ];
      treesitter.autotagHtml = true;
    };
  };
}

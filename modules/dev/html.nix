{
  config,
  lib,
  ...
}:
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
    programs.nvf.settings.vim = lib.mkIf cfg.nvf {
      languages = {
        html = {
          enable = true;
          format.type = [ "prettier" ];
        };
        scss.enable = true;
        tsx.enable = true;
        css = {
          enable = true;
          format.enable = true;
        };
      };
      lsp.presets.tailwindcss-language-server.enable = true;
    };
  };
}

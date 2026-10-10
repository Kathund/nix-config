{
  config,
  lib,
  username,
  ...
}:
let
  program = "javascript";
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
    programs.nvf.settings.vim.languages = lib.mkIf cfg.nvf {
      typescript = {
        enable = true;
        extensions.ts-error-translator.enable = true;
      };
      json5.enable = true;
      json = {
        enable = true;
        format.type = [ "prettier" ];
      };
    };
    home-manager.users.${username} = { pkgs, ... }: {
      home.packages = with pkgs; [
        prettier
        eslint
        tsx
        typescript
      ];
    };
  };
}

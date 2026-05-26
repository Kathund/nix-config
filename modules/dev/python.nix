{
  config,
  lib,
  username,
  ...
}:
let
  program = "python";
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
    programs.nvf.settings.vim.languages.python = lib.mkIf cfg.nvf {
      enable = true;
      format.type = [ "black" ];
    };
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          python313
          uv
        ];
      };
  };
}

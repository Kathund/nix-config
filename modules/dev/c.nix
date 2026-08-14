{
  config,
  lib,
  username,
  ...
}:
let
  program = "c";
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
    programs.nvf.settings.vim.languages.clang.enable = lib.mkIf cfg.nvf true;
    home-manager.users.${username} = { pkgs, ... }: { home.packages = with pkgs; [ clang ]; };
  };
}

{
  config,
  lib,
  username,
  ...
}:
let
  program = "nodejs";
  cfg = config.modules.dev.${program};
in
{
  options.modules.dev.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    zsh = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        programs.zsh.shellAliases = lib.mkIf cfg.zsh {
          pnpmCheck = "pnpm prettier && pnpm eslint && pnpm build";
        };
        home.packages = with pkgs; [
          nodejs_24
          pnpm
        ];
      };
  };
}

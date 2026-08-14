{
  config,
  lib,
  username,
  ...
}:
let
  program = "bun";
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
    home-manager.users.${username} = { pkgs, ... }: {
      programs.zsh.shellAliases = lib.mkIf cfg.zsh {
        bunCheck = "bun prettier && bun eslint && bun run build";
      };
      home.packages = with pkgs; [ bun ];
    };
  };
}

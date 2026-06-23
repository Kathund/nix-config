{
  config,
  lib,
  username,
  ...
}:
let
  program = "deno";
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
          denoCheck = "deno prettier && deno eslint && deno run build";
        };
        home.packages = with pkgs; [ deno ];
      };
  };
}

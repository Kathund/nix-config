{
  config,
  lib,
  username,
  ...
}:
let
  program = "git";
  cfg = config.modules.terminal.${program};
in
{
  options.modules.terminal.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    username = lib.mkOption { type = lib.types.str; };
    email = lib.mkOption { type = lib.types.str; };
    signCommits = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  imports = [
    ./gh.nix
    ./lazygit.nix
  ];

  config = lib.mkIf cfg.enable {
    home-manager.users.${username}.programs.${program} = {
      enable = true;
      settings.user = {
        name = cfg.username;
        inherit (cfg) email;
      };
      signing.signByDefault = cfg.signCommits;
    };
  };
}

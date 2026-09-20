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
        signingkey = "926AE4E7F90CC6E2FED6D71B0CC25AAA1364985C";
      };
      signing.signByDefault = cfg.signCommits;
    };
  };
}

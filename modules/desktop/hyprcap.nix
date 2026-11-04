{
  config,
  lib,
  username,
  inputs,
  ...
}:
let
  program = "hyprcap";
  cfg = config.modules.desktop.${program};
in
{
  options.modules.desktop.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} = { pkgs, ... }: {
      home.packages = [ inputs.hyprcap.packages.${pkgs.stdenv.hostPlatform.system}.default ];
    };
  };
}

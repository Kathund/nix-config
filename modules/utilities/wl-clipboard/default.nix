{
  config,
  lib,
  username,
  ...
}:
let
  program = "wl-clipboard";
  cfg = config.modules.utilities.${program};
in
{
  options.modules.utilities.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home = {
              packages = with pkgs; [ wl-clipboard ];
            };
          };
      };
    };
  };
}

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
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home = {
              packages = with pkgs; [
                nodejs_24
                pnpm_9
                prettier
                eslint
                tsx
                typescript
              ];
            };
          };
      };
    };
  };
}

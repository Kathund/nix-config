{
  config,
  lib,
  username,
  ...
}:
let
  program = "sound";
  cfg = config.modules.hardware.${program};
in
{
  options.modules.hardware.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  imports = [ ./pipeweaver.nix ];

  config = lib.mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      wireplumber.enable = true;
    };
    home-manager.users.${username} = { pkgs, ... }: {
      services.playerctld.enable = true;
      home.packages = with pkgs; [ qpwgraph ];
    };
  };
}

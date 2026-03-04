{
  lib,
  config,
  ...
}:
with lib;
let
  program = "nvidia";
  cfg = config.modules.hardware.display.drivers.${program};
in
{
  options.modules.hardware.display.drivers.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = mkIf cfg.enable {
    services = {
      xserver = {
        videoDrivers = [ "nvidia" ];
      };
    };
    hardware = {
      graphics = {
        enable = true;
      };
      nvidia = {
        modesetting = {
          enable = true;
        };
        powerManagement = {
          enable = false;
          finegrained = false;
        };
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
    };
  };
}

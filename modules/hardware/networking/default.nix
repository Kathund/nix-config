{
  config,
  lib,
  ...
}:
let
  program = "networking";
  cfg = config.modules.hardware.${program};
in
{
  options.modules.hardware.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
    disableIPv6 = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    boot = lib.mkIf cfg.disableIPv6 {
      kernel = {
        sysctl = {
          "net.ipv6.conf.all.disable_ipv6" = "1";
          "net.ipv6.conf.default.disable_ipv6" = "1";
          "net.ipv6.conf.lo.disable_ipv6" = "1";
        };
      };
      kernelParams = [ "ipv6.disable=1" ];
    };
    networking = {
      nameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
      useDHCP = lib.mkDefault true;
      enableIPv6 = !cfg.disableIPv6;
    };
  };
}

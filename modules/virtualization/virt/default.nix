{
  config,
  lib,
  username,
  pkgs,
  ...
}:
let
  program = "virt";
  cfg = config.modules.virtualization.${program};
in
{
  options.modules.virtualization.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    users = {
      users = {
        ${username} = {
          extraGroups = [
            "libvirtd"
          ];
        };
      };
    };
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          vhostUserPackages = with pkgs; [ virtiofsd ];
        };
      };
    };
    programs = {
      virt-manager = {
        enable = true;
      };
    };
    services = {
      qemuGuest = {
        enable = true;
      };
      spice-vdagentd = {
        enable = true;
      };
    };
    environment = {
      systemPackages = with pkgs; [
        dnsmasq
      ];
    };
    networking = {
      firewall = {
        trustedInterfaces = [ "virbr0" ];
      };
    };
  };
}

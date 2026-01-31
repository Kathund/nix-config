{
  username,
  ...
}:
{
  imports = [
    ./modules
    ./hardware-configuration.nix
  ];
  networking = {
    hostName = "toffee";
    firewall = {
      allowedTCPPorts = [
        44461
      ];
    };
  };
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };
  home-manager = {
    users = {
      ${username} = {
        wayland = {
          windowManager = {
            hyprland = {
              settings = {
                monitor = [
                  "DP-1, 1920x1080@240, 0x0, 1"
                ];
              };
            };
          };
        };
      };
    };
  };
}

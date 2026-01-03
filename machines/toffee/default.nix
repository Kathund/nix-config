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
  };

  services = {
    printing = {
      enable = true;
    };
  };

  security = {
    rtkit = {
      enable = true;
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

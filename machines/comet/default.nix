{
  imports = [
    ./modules
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "comet";
  };

  services = {
    xserver = {
      enable = true;
    };
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
      grub = {
        device = "/dev/sda";
      };
    };
  };
}

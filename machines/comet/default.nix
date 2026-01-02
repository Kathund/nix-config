{
  imports = [
    ./modules
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "comet";
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
      grub = {
        device = "/dev/sda";
      };
    };
  };
}

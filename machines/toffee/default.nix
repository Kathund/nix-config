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
}

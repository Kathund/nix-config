{
  imports = [
    ./modules
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "toffee";
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
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };
}

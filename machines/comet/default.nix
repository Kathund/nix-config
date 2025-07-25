{
  imports = [
    ./hardware-configuration.nix
    ./programs
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
  programs.firefox.enable = true;

  boot = {
    loader = {
      grub = {
        device = "/dev/sda";
      };
    };
  };
}

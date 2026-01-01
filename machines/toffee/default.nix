{
  imports = [
    ./hardware-configuration.nix
    ./programs
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
  programs.firefox.enable = true;

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

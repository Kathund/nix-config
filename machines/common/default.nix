{
  imports = [
    ./nix
    ./programs
  ];

  time.timeZone = "Australia/Perth";
  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;

  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  services.xserver = {
    xkb = {
      layout = "au";
      variant = "";
    };
  };

  services.openssh.enable = true;

  system.stateVersion = "25.11";
}

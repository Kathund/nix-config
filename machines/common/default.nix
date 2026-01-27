{
  pkgs,
  ...
}:
{
  imports = [
    ./modules
    ./nix
  ];
  time = {
    timeZone = "Australia/Perth";
  };
  i18n = {
    defaultLocale = "en_AU.UTF-8";
  };
  services = {
    xserver = {
      xkb = {
        layout = "au";
        variant = "";
      };
    };
    openssh = {
      enable = true;
    };
  };
  security = {
    rtkit = {
      enable = true;
    };
  };
  programs = {
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
    command-not-found = {
      enable = false;
    };
  };
  environment = {
    systemPackages = with pkgs; [
      killall
      wget
    ];
  };
  system = {
    stateVersion = "26.05";
  };
}

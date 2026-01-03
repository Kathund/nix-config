{
  imports = [
    ./modules
    ./nix
  ];

  time = {
    timeZone = "Australia/Perth";
  };

  networking = {
    networkmanager.enable = true;
    enableIPv6 = false;
  };

  boot = {
    kernel = {
      sysctl = {
        "net.ipv6.conf.all.disable_ipv6" = "1";
        "net.ipv6.conf.default.disable_ipv6" = "1";
        "net.ipv6.conf.lo.disable_ipv6" = "1";
      };
    };
    kernelParams = [ "ipv6.disable=1"];
  };


  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  i18n = {
    defaultLocale = "en_AU.UTF-8";
    extraLocaleSettings = {
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

  system = {
    stateVersion = "26.11";
  };
}

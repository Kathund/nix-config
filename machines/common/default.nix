{
  imports = [ ./modules.nix ];

  time.timeZone = "Australia/Perth";
  i18n.defaultLocale = "en_AU.UTF-8";

  services = {
    xserver.xkb = {
      layout = "au";
      variant = "";
    };
    openssh.enable = true;
  };
  security.rtkit.enable = true;
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    command-not-found.enable = false;
  };

  nix = {
    gc = {
      automatic = true;
      dates = [ "weekly" ];
      options = "--delete-older-than 30d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
  };
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _pkg: true;
  };

  users.motd = ''
     __  __                       _______
    |  \/  | ___  _____      __  / /___ /
    | |\/| |/ _ \/ _ \ \ /\ / / / /  |_ \
    | |  | |  __/ (_) \ V  V /  \ \ ___) |
    |_|  |_|\___|\___/ \_/\_/    \_\____/
  '';

  system.stateVersion = "26.05";
}

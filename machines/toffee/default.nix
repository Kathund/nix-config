{ username, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./modules.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  users.motd = ''
     _____      __  __              _______
    |_   _|__  / _|/ _| ___  ___   / /___ /
      | |/ _ \| |_| |_ / _ \/ _ \ / /  |_ \
      | | (_) |  _|  _|  __/  __/ \ \ ___) |
      |_|\___/|_| |_|  \___|\___|  \_\____/
  '';

  environment.systemPackages = with pkgs; [
    stdenv.cc.cc
    glib
    cups
    alsa-lib
    fontconfig
    freetype
    cairo
    gtk3
    ffmpeg.lib
    gtk2

    libX11
    libXext
    libXi
    libXrender
    libXtst
    libXxf86vm
    zlib
    libGL
  ];

  networking.firewall.allowedTCPPorts = [ 44461 ];
  home-manager.users.${username}.wayland.windowManager.hyprland.settings.monitor = [
    {
      output = "DP-1";
      mode = "1920x1080@240";
      position = "0x0";
      scale = "1";
    }
  ];
}

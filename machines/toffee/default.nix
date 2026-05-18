{ username, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

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

  home-manager.users.${username}.wayland.windowManager.hyprland.settings.monitor = [
    "DP-1, 1920x1080@240, 0x0, 1"
    "HDMI-A-1, 1920x1080@60, 1920x0, 1"
  ];
}

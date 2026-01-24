{
  username,
  ...
}:
{
  imports = [
    ./modules
    ./hardware-configuration.nix
  ];
  networking = {
    hostName = "comet";
  };
  boot = {
    loader = {
      grub = {
        device = "/dev/sda";
      };
    };
  };
  home-manager = {
    users = {
      ${username} = {
        wayland = {
          windowManager = {
            hyprland = {
              settings = {
                monitor = [ ", preferred, auto, 1" ];
              };
            };
          };
        };
      };
    };
  };
}

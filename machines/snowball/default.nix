{
  imports = [
    ./hardware-configuration.nix
    ./homelab
    ./programs
  ];

  networking = {
    hostName = "snowball";
  };

  boot.loader.grub.device = "/dev/sda";
}

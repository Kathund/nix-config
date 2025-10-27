{
  imports = [
    ./hardware-configuration.nix
    ./programs
  ];

  networking = {
    hostName = "snowball";
  };

  boot = {
    loader = {
      grub = {
        device = "/dev/sda";
      };
    };
  };
}

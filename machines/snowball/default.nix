{
  imports = [
    ./modules
    ./hardware-configuration.nix
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

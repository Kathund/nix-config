{
  imports = [
    ./modules
    ./hardware-configuration.nix
  ];
  networking = {
    firewall = {
      allowedTCPPorts = [
        80
        25565
        44361
        27017
        32464
      ];
    };
  };
  boot = {
    loader = {
      grub = {
        device = "/dev/sda";
      };
    };
  };
}

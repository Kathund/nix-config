{
  imports = [
    ./modules
    ./hardware-configuration.nix
  ];
  networking = {
    hostName = "snowball";
    firewall = {
      allowedTCPPorts = [
        80
        25565
        44361
        27017
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

{
  imports = [
    ./hardware-configuration.nix
    ./modules.nix
  ];

  networking.firewall.allowedTCPPorts = [
    80
    5555
    27017
    32464
    44361
  ];
}

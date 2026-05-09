{
  imports = [
    ./hardware-configuration.nix
    ./modules.nix
  ];

  networking.firewall.allowedTCPPorts = [
    80
    25565
    44361
    27017
    32464
  ];
}

{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  program = "oneclient";
  cfg = config.modules.applications.games.${program};
in
{
  options.modules.applications.games.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [
      (_: prev: { inherit (inputs.oneclient.legacyPackages.${prev.system}) oneclient; })
    ];
    environment.systemPackages = [
      inputs.oneclient.legacyPackages.${pkgs.stdenv.hostPlatform.system}.oneclient
    ];
  };
}

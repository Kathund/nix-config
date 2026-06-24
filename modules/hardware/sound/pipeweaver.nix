{
  config,
  lib,
  pkgs,
  username,
  inputs,
  ...
}:
let
  program = "pipeweaver";
  cfg = config.modules.hardware.sound.${program};
in
{
  options.modules.hardware.sound.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    loadOnStartup = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };
  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [
      (_: prev: { inherit (inputs.pipeweaver.legacyPackages.${prev.system}) pipeweaver; })
    ];
    environment.systemPackages = [
      inputs.pipeweaver.legacyPackages.${pkgs.stdenv.hostPlatform.system}.pipeweaver
    ];
    home-manager.users.${username}.wayland.windowManager.hyprland.settings.exec-once =
      lib.mkIf cfg.loadOnStartup
        [ "pipeweaver-daemon --background" ];
  };
}

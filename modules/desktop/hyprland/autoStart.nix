{
  config,
  lib,
  username,
  ...
}:
let
  cfg = config.modules.desktop.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    home-manager.users.${username}.wayland.windowManager.hyprland.settings.on._args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("streamcontroller -b")
          hl.exec_cmd("update-wallpaper")
          hl.exec_cmd("wayle")
          hl.exec_cmd("qpwgraph -m")
          hl.exec_cmd("pipeweaver --background")
        end
      '')
    ];
  };
}

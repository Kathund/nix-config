{
  config,
  lib,
  username,
  ...
}:
let
  cfg = config.modules.desktop.hyprland;

  superBind = keys: action: {
    _args = [
      (lib.mkLuaInline "mod .. \" + ${keys}\"")
      (lib.mkLuaInline action)
    ];
  };

  superShiftBind = keys: action: {
    _args = [
      (lib.mkLuaInline "mod .. \" + SHIFT + ${keys}\"")
      (lib.mkLuaInline action)
    ];
  };
in
{
  config = lib.mkIf cfg.enable {
    home-manager.users.${username}.wayland.windowManager.hyprland.settings = {
      bind = [
        # Workspaces
        (superBind "1" "hl.dsp.focus({ workspace = \"1\" })")
        (superBind "2" "hl.dsp.focus({ workspace = \"2\" })")
        (superBind "3" "hl.dsp.focus({ workspace = \"3\" })")
        (superBind "4" "hl.dsp.focus({ workspace = \"4\" })")
        (superBind "5" "hl.dsp.focus({ workspace = \"5\" })")
        (superBind "6" "hl.dsp.focus({ workspace = \"6\" })")
        (superBind "7" "hl.dsp.focus({ workspace = \"7\" })")
        (superBind "8" "hl.dsp.focus({ workspace = \"8\" })")
        (superBind "9" "hl.dsp.focus({ workspace = \"9\" })")
        (superBind "0" "hl.dsp.focus({ workspace = \"10\" })")

        (superShiftBind "1" "hl.dsp.window.move({ workspace = \"1\" })")
        (superShiftBind "2" "hl.dsp.window.move({ workspace = \"2\" })")
        (superShiftBind "3" "hl.dsp.window.move({ workspace = \"3\" })")
        (superShiftBind "4" "hl.dsp.window.move({ workspace = \"4\" })")
        (superShiftBind "5" "hl.dsp.window.move({ workspace = \"5\" })")
        (superShiftBind "6" "hl.dsp.window.move({ workspace = \"6\" })")
        (superShiftBind "7" "hl.dsp.window.move({ workspace = \"7\" })")
        (superShiftBind "8" "hl.dsp.window.move({ workspace = \"8\" })")
        (superShiftBind "9" "hl.dsp.window.move({ workspace = \"9\" })")
        (superShiftBind "0" "hl.dsp.window.move({ workspace = \"10\" })")
      ];
      workspace_rule = [
        {
          workspace = "1";
          monitor = "DP-1";
        }
        {
          workspace = "2";
          monitor = "DP-1";
        }
        {
          workspace = "3";
          monitor = "DP-1";
        }
        {
          workspace = "4";
          monitor = "DP-1";
        }
        {
          workspace = "5";
          monitor = "DP-1";
        }
        {
          workspace = "6";
          monitor = "DP-1";
        }
        {
          workspace = "7";
          monitor = "DP-1";
        }
        {
          workspace = "8";
          monitor = "DP-1";
        }
        {
          workspace = "9";
          monitor = "DP-1";
        }
        {
          workspace = "10";
          monitor = "DP-1";
        }
        {
          workspace = "11";
          monitor = "HDMI-A-1";
        }
        {
          workspace = "12";
          monitor = "HDMI-A-1";
        }
        {
          workspace = "14";
          monitor = "HDMI-A-1";
        }
        {
          workspace = "15";
          monitor = "HDMI-A-1";
        }
        {
          workspace = "16";
          monitor = "HDMI-A-1";
        }
        {
          workspace = "17";
          monitor = "HDMI-A-1";
        }
        {
          workspace = "18";
          monitor = "HDMI-A-1";
        }
        {
          workspace = "19";
          monitor = "HDMI-A-1";
        }
        {
          workspace = "20";
          monitor = "HDMI-A-1";
        }
      ];
    };
  };
}

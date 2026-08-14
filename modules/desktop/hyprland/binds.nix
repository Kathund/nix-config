{
  config,
  lib,
  username,
  ...
}:
let
  cfg = config.modules.desktop.hyprland;

  lock = "{ locked = true }";
  lockRepeat = "{ locked = true, repeating = true }";

  exec = action: "hl.dsp.exec_cmd(\"${action}\")";

  # Create a bind under keys
  bind = keys: action: {
    _args = [
      keys
      (lib.mkLuaInline action)
    ];
  };

  # Create a bind under keys with options
  bindOpts = key: action: opts: {
    _args = [
      key
      (lib.mkLuaInline action)
      (lib.mkLuaInline opts)
    ];
  };

  # Create a bind under the mod (SUPER) + keys
  superBind = keys: action: {
    _args = [
      (lib.mkLuaInline "mod .. \" + ${keys}\"")
      (lib.mkLuaInline action)
    ];
  };

  # Create a bind under the mod (SUPER) + SHIFT + keys
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
      mod._var = "SUPER";
      bind = [
        (superBind "C" "hl.dsp.window.close()") # killactive
        (superShiftBind "M" "hl.dsp.exit()") # exit
        (superBind "V" "hl.dsp.window.float()") # togglefloating

        # Move focus
        (superBind "left" "hl.dsp.focus({ direction = \"left\" })")
        (superBind "H" "hl.dsp.focus({ direction = \"left\" })")

        (superBind "down" "hl.dsp.focus({ direction = \"down\" })")
        (superBind "J" "hl.dsp.focus({ direction = \"down\" })")

        (superBind "up" "hl.dsp.focus({ direction = \"up\" })")
        (superBind "K" "hl.dsp.focus({ direction = \"up\" })")

        (superBind "L" "hl.dsp.focus({ direction = \"right\" })")
        (superBind "right" "hl.dsp.focus({ direction = \"right\" })")

        (superBind "mouse:272" "hl.dsp.window.drag()") # movewindow
        (superBind "mouse:273" "hl.dsp.window.resize()") # resizewindow

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

        # Exec stuff
        (bind "PRINT" (exec "hyprshot -m region --freeze --clipboard-only"))
        (superBind "S" (exec "librewolf"))
        (superBind "Q" (exec "kitty"))
        (superBind "E" (exec "dolphin"))
        (superBind "L" (exec "hyprlock"))
        (superShiftBind "S" (exec "vicinae toggle"))
        (superShiftBind "V" (exec "vicinae vicinae://launch/clipboard/history"))

        (bindOpts "XF86MonBrightnessUp" (exec "brightnessctl set +5%") lockRepeat)
        (bindOpts "XF86MonBrightnessDown" (exec "brightnessctl set 5%-") lockRepeat)

        (bindOpts "XF86AudioMute" (exec "wpctl set-mute @DEFAULT_SINK@ toggle") lock)
        (bindOpts "XF86AudioRaiseVolume" (exec "wpctl set-volume -l 1 @DEFAULT_SINK@ 5%+") lockRepeat)
        (bindOpts "XF86AudioLowerVolume" (exec "wpctl set-volume -l 1 @DEFAULT_SINK@ 5%-") lockRepeat)

        (bindOpts "XF86AudioPlay" (exec "playerctl play-pause") lock)
        (bindOpts "XF86AudioPause" (exec "playerctl play-pause") lock)
        (bindOpts "XF86AudioPrev" (exec "playerctl previous") lock)
        (bindOpts "XF86AudioNext" (exec "playerctl next") lock)
      ];
    };
  };
}

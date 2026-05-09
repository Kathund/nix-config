{
  config,
  lib,
  username,
  ...
}:
let
  program = "fastfetch";
  cfg = config.modules.terminal.${program};
in
{
  options.modules.terminal.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username}.programs.${program} = {
      enable = true;
      settings.modules = [
        "title"
        "separator"
        {
          type = "datetime";
          format = "{year}-{month}-{day-in-month} {hour}:{minute}:{second} ({offset-from-utc})";
        }
        {
          type = "cpu";
          format = "{name} ({cores-logical}) @ {freq-max} {temperature}";
        }
        {
          type = "disk";
          format = "{size-used} / {size-total} ({size-percentage})";
        }
        {
          type = "display";
          format = "{width}x{height} {inch}\" @{refresh-rate}Hz [{type}] {is-primary}";
        }
        {
          type = "editor";
          format = "{name} [{type}]";
        }
        "font"
        "gpu"
        "kernel"
        {
          type = "localip";
          showAllIps = true;
          showSpeed = true;
        }
        {
          type = "memory";
          format = "{used} / {total} ({percentage})";
        }
        {
          type = "os";
          format = "{name} {build-id} ({codename}) {arch}";
        }
        "packages"
        {
          type = "shell";
          format = "{pretty-name}";
        }
        {
          type = "swap";
          format = "{used} / {total} ({percentage})";
        }
        {
          type = "terminal";
          format = "{pretty-name} ({tty})";
        }
        "theme"
        "uptime"
        "wm"

        "break"

        "battery"
        "bluetooth"
        "bluetoothradio"
        "brightness"
        "btrfs"
        "camera"
        "de"
        "gamepad"
        "physicalmemory"
        "poweradapter"
        "wifi"
        "zpool"

        "break"

        "colors"
      ];
    };
  };
}

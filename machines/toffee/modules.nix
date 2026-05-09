{ username, ... }:
{
  config.modules = {
    configPath = "/home/${username}/github/nix-config";
    applications = {
      browsers = {
        chromium.enable = true;
        firefox.enable = true;
        librewolf = {
          enable = true;
          hyprlandBind = true;
          setDefault = true;
        };
      };
      communication = {
        element.enable = true;
        signal.enable = true;
        telegram.enable = true;
        vesktop.enable = true;
      };
      games = {
        lunar-client.enable = true;
        prism-launcher.enable = true;
        steam.enable = true;
        protonup-qt.enable = true;
      };
      ark.enable = true;
      dolphin.enable = true;
      jetbrains-idea.enable = true;
      kate.enable = true;
      kdenlive.enable = true;
      krita.enable = true;
      mongodb-compass.enable = true;
      obs-studio.enable = true;
      spicetify.enable = true;
      streamcontroller.enable = true;
      vlc.enable = true;
    };
    desktop = {
      hyprland = {
        enable = true;
        loadWorkspaceBinds = false;
        plugins.split-monitor-workspaces.enable = true;
      };
      plasma.enable = true;
      awww.enable = true;
      fonts.enable = true;
      gtk.enable = true;
      hyprlock.enable = true;
      hyprshot.enable = true;
      vicinae.enable = true;
      wayle.enable = true;
    };
    dev = {
      astro.enable = true;
      bun.enable = true;
      css.enable = true;
      html.enable = true;
      java.enable = true;
      javascript.enable = true;
      kotlin.enable = true;
      markdown.enable = true;
      nodejs.enable = true;
      python.enable = true;
      rust.enable = true;
      tailwind.enable = true;
    };
    hardware = {
      sddm.enable = true;
      sound.enable = true;
      nvidia.enable = true;
    };
    terminal = {
      git.signCommits = true;
      wl-clipboard.enable = true;
    };
  };
}

{ username, ... }: {
  config.modules = {
    configPath = "/home/${username}/github/nix-config";
    applications = {
      browsers = {
        chromium.enable = true;
        firefox.enable = true;
        librewolf = {
          enable = true;
          setDefault = true;
        };
      };
      communication = {
        discord.canary.enable = true;
        element.enable = true;
        signal.enable = true;
        telegram.enable = true;
        vesktop.enable = true;
      };
      games = {
        celeste.enable = true;
        oneclient.enable = true;
        packwiz.enable = true;
        prism-launcher.enable = true;
        proton.enable = true;
        steam.enable = true;
      };
      ark.enable = true;
      dolphin.enable = true;
      drawy.enable = true;
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
      hyprland.enable = true;
      awww.enable = true;
      fonts.enable = true;
      gtk.enable = true;
      hyprlock.enable = true;
      hyprshot.enable = true;
      plasma.enable = true;
      vicinae.enable = true;
      wayle.enable = true;
    };
    dev = {
      bun.enable = true;
      java.enable = true;
      javascript.enable = true;
      kotlin.enable = true;
      markdown.enable = true;
      nodejs.enable = true;
      python.enable = true;
      rust.enable = true;
    };
    hardware = {
      nvidia.enable = true;
      sddm.enable = true;
      sound = {
        enable = true;
        pipeweaver.enable = true;
      };
    };
    terminal = {
      git.signCommits = true;
      ffmpeg.enable = true;
      scdl.enable = true;
      wl-clipboard.enable = true;
    };
  };
}

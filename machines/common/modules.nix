{
  config.modules = {
    applications = {
      kitty.enable = true;
      nvf.enable = true;
    };
    dev = {
      bash.enable = true;
      c.enable = true;
      make.enable = true;
      nix.enable = true;
    };
    desktop.catppuccin.enable = true;
    hardware.networking.enable = true;
    terminal = {
      git = {
        enable = true;
        username = "Jacob";
        email = "kathund@proton.me";
        gh.enable = true;
        lazygit.enable = true;
      };
      btop.enable = true;
      busybox.enable = true;
      fastfetch.enable = true;
      fzf.enable = true;
      htop.enable = true;
      hyfetch = {
        enable = true;
        brightness = 0.50;
        backend = "fastfetch";
        preset = "bisexual";
      };
      jq.enable = true;
      ncdu.enable = true;
      ripgrep.enable = true;
      starship.enable = true;
      tree.enable = true;
      zip.enable = true;
      zsh.enable = true;
    };
  };
}

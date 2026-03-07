{
  config,
  lib,
  username,
  machine,
  ...
}:
let
  program = "zsh";
  cfg = config.modules.terminal.cli.${program};
in
{
  options.modules.terminal.cli.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      ${program} = {
        enable = true;
      };
    };
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            programs = {
              ${program} = {
                enable = true;
                enableCompletion = false;
                autosuggestion = {
                  enable = true;
                };
                syntaxHighlighting = {
                  enable = true;
                };
                shellAliases = {
                  ll = "ls -l";
                  ls = "ls --color";
                  update = "sudo nixos-rebuild switch --flake ${config.modules.configPath}#${machine}";
                };
                zplug = {
                  enable = true;
                  plugins = [
                    { name = "zsh-users/zsh-autosuggestions"; }
                    { name = "zsh-users/zsh-syntax-highlighting"; }
                    { name = "zsh-users/zsh-completions"; }
                    { name = "zsh-users/zsh-history-substring-search"; }
                    { name = "unixorn/warhol.plugin.zsh"; }
                  ];
                };
                initContent = "";
              };
            };
            catppuccin = {
              zsh-syntax-highlighting = {
                enable = false;
              };
            };
          };
      };
    };
  };
}

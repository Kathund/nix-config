{
  config,
  lib,
  username,
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
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home.packages = with pkgs; [ grc ];

            programs = {
              ${program} = {
                enable = true;
                enableCompletion = false;
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

                shellAliases = {
                };

                initContent = '''';
              };
            };
          };
      };
    };
  };
}

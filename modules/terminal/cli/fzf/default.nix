{
  config,
  lib,
  username,
  ...
}:
let
  program = "fzf";
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
        ${username} = {
          programs = {
            ${program} = {
              enable = true;
              enableZshIntegration = true;
              colors = {
                fg = "#D8DEE9";
                bg = "#2E3440";
                hl = "#A3BE8C";
                "fg+" = "#D8DEE9";
                "bg+" = "#434C5E";
                "hl+" = "#A3BE8C";
                pointer = "#BF616A";
                info = "#4C566A";
                spinner = "#4C566A";
                header = "#4C566A";
                prompt = "#81A1C1";
                marker = "#EBCB8B";
              };
            };
          };
        };
      };
    };
  };
}

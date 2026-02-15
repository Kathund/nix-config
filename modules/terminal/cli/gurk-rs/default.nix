{
  config,
  lib,
  username,
  ...
}:
let
  program = "gurk-rs";
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
              settings = {
                first_name_only = false;
                show_receipts = true;
                notifications = {
                  enable = false;
                };
                bell = false;
                colored_messages = true;
                default_keybindings = true;
                user = {
                  name = username;
                  phone_number = "MYNUMBER";
                };
              };
            };
          };
        };
      };
    };
  };
}

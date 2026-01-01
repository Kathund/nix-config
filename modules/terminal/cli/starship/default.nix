{
  config,
  lib,
  username,
  ...
}:
let
  program = "starship";
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
                add_newline = true;
                format = "[](#9A348E)$username$hostname[](bg:#DA627D fg:#9A348E)$directory[](fg:#DA627D bg:#FCA17D)$git_branch$git_status[](fg:#FCA17D bg:#86BBD8)$nodejs[](fg:#86BBD8 bg:#06969A)\$docker_context[](fg:#06969A bg:#33658A)$time$cmd_duration[ ](fg:#33658A)";
                username = {
                  show_always = true;
                  style_user = "bg:#9A348E";
                  style_root = "bg:#9A348E";
                  format = "[$user ]($style)";
                  disabled = false;
                };
                hostname = {
                  ssh_only = false;
                  format = "[$ssh_symbol$hostname ]($style)";
                  style = "bg:#9A348E";
                };
                directory = {
                  style = "bg:#DA627D";
                  format = "[ $path ]($style)";
                  truncation_length = 3;
                  truncation_symbol = "…/";
                  substitutions = {
                    Documents = "󰈙 ";
                    Downloads = " ";
                    Music = " ";
                    Pictures = " ";
                  };
                };
                docker_context = {
                  symbol = " ";
                  style = "bg:#06969A";
                  format = "[ $symbol $context ]($style)";
                };
                git_branch = {
                  symbol = "";
                  style = "bg:#FCA17D";
                  format = "[ $symbol $branch ]($style)";
                };
                git_status = {
                  style = "bg:#FCA17D";
                  format = "[$all_status$ahead_behind ]($style)";
                };
                nodejs = {
                  symbol = "";
                  style = "bg:#86BBD8";
                  format = "[ $symbol ($version) ]($style)";
                };
                time = {
                  disabled = false;
                  time_format = "%R";
                  style = "bg:#33658A";
                  format = "[ ♥ $time ]($style)";
                };
                cmd_duration = {
                  disabled = false;
                  style = "bg:#33658A";
                  format = "[taken $duration ]($style)";
                };
              };
            };
          };
        };
      };
    };
  };
}

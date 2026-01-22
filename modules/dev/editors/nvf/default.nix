{
  config,
  pkgs,
  lib,
  inputs,
  username,
  ...
}:
let
  program = "nvf";
  cfg = config.modules.dev.editors.${program};
in
{
  imports = [ inputs.nvf.nixosModules.default ];
  options.modules.dev.editors.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      ${program} = {
        enable = true;
        defaultEditor = true;
        settings = {
          vim = {
            preventJunkFiles = true;
            enableLuaLoader = true;
            viAlias = true;
            vimAlias = true;
            undoFile = {
              enable = true;
            };
            theme = {
              enable = true;
              name = "catppuccin";
              style = "mocha";
              transparent = false;
            };
            statusline = {
              lualine = {
                enable = true;
                theme = "catppuccin";
              };
            };
            telescope = {
              enable = true;
              mappings = {
                diagnostics = "<leader>fd";
                findFiles = "<leader>fF";
                gitFiles = "<leader>ff";
                liveGrep = "<leader>fc";
              };
            };
            autocomplete = {
              nvim-cmp = {
                enable = true;
              };
            };
            lsp = {
              enable = true;
              formatOnSave = true;
              lightbulb = {
                enable = true;
                autocmd = {
                  enable = true;
                };
              };
              mappings = {
                format = "<leader>cf";
                goToDeclaration = "<leader>gD";
                goToDefinition = "<leader>gd";
                listImplementations = "<leader>li";
                listReferences = "<leader>lr";
                nextDiagnostic = "<leader>gn";
                previousDiagnostic = "<leader>gp";
              };
              trouble = {
                enable = true;
                mappings = {
                  quickfix = "<leader>cF";
                };
              };
            };
            git = {
              enable = true;
            };
            clipboard = {
              enable = true;
              providers = {
                wl-copy = {
                  enable = true;
                };
              };
            };
            binds = {
              cheatsheet = {
                enable = true;
              };
              whichKey = {
                enable = true;
                register = {
                  "<leader>f" = " Telescope";
                  "<leader>g" = " Git";
                };
                setupOpts = {
                  preset = "helix";
                };
              };
            };
            visuals = {
              fidget-nvim = {
                enable = true;
              };
              nvim-web-devicons = {
                enable = true;
              };
              nvim-cursorline = {
                enable = true;
              };
              highlight-undo = {
                enable = true;
              };
            };
            utility = {
              icon-picker = {
                enable = true;
              };
              diffview-nvim = {
                enable = true;
              };
              motion = {
                leap = {
                  enable = true;
                };
              };
              snacks-nvim = {
                enable = true;
                setupOpts = {
                  gh = {
                    enabled = true;
                  };
                  dashboard = {
                    enabled = true;
                    width = 80;
                    sections = [
                      { section = "header"; }
                      {
                        pane = 2;
                        section = "keys";
                        gap = 1;
                        padding = 1;
                      }
                      {
                        pane = 2;
                        section = "terminal";
                        padding = 2;
                        indent = 2;
                        title = "Open Issues";
                        cmd = "gh issue list -L 5";
                        icon = " ";
                        height = 10;
                        key = "i";
                        action = ":lua Snacks.picker.gh_issue()";
                      }
                      {
                        pane = 2;
                        section = "terminal";
                        padding = 2;
                        indent = 2;
                        icon = " ";
                        title = "Open PRs";
                        cmd = "gh pr list -L 5";
                        height = 10;
                        key = "p";
                        action = ":lua Snacks.picker.gh_pr()";
                        header = "meow?";
                        footer = "no meow?";
                      }
                    ];
                    preset = {
                      header = ''
                        ███╗   ███╗███████╗ ██████╗ ██╗    ██╗
                        ████╗ ████║██╔════╝██╔═══██╗██║    ██║
                        ██╔████╔██║█████╗  ██║   ██║██║ █╗ ██║
                        ██║╚██╔╝██║██╔══╝  ██║   ██║██║███╗██║
                        ██║ ╚═╝ ██║███████╗╚██████╔╝╚███╔███╔╝
                        ╚═╝     ╚═╝╚══════╝ ╚═════╝  ╚══╝╚══╝

                        ██╗   ██╗██╗    ██╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
                        ██║   ██║██║    ██║██║   ██║██║   ██║██║████╗ ████║
                        ██║   ██║██║ █╗ ██║██║   ██║██║   ██║██║██╔████╔██║
                        ██║   ██║██║███╗██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
                        ╚██████╔╝╚███╔███╔╝╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
                         ╚═════╝  ╚══╝╚══╝  ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

                        ███╗   ███╗███████╗ ██████╗ ██╗    ██╗
                        ████╗ ████║██╔════╝██╔═══██╗██║    ██║
                        ██╔████╔██║█████╗  ██║   ██║██║ █╗ ██║
                        ██║╚██╔╝██║██╔══╝  ██║   ██║██║███╗██║
                        ██║ ╚═╝ ██║███████╗╚██████╔╝╚███╔███╔╝
                        ╚═╝     ╚═╝╚══════╝ ╚═════╝  ╚══╝╚══╝
                      '';
                      footer = ''
                        ███╗   ███╗███████╗ ██████╗ ██╗    ██╗
                        ████╗ ████║██╔════╝██╔═══██╗██║    ██║
                        ██╔████╔██║█████╗  ██║   ██║██║ █╗ ██║
                        ██║╚██╔╝██║██╔══╝  ██║   ██║██║███╗██║
                        ██║ ╚═╝ ██║███████╗╚██████╔╝╚███╔███╔╝
                        ╚═╝     ╚═╝╚══════╝ ╚═════╝  ╚══╝╚══╝
                      '';
                      keys = [
                        {
                          action = ":lua Snacks.dashboard.pick('files')";
                          desc = " Find File";
                          icon = " ";
                          key = "f";
                        }
                        {
                          action = ":lua Snacks.dashboard.pick('live_grep')";
                          desc = " Find Code";
                          icon = " ";
                          key = "c";
                        }
                        {
                          action = ":lua Snacks.lazygit()";
                          desc = " Git";
                          icon = "󰊢 ";
                          key = "g";
                        }
                        {
                          action = ":qa";
                          desc = " Quit";
                          icon = " ";
                          key = "q";
                        }
                      ];
                    };
                  };
                  explorer = {
                    replace_netrw = true;
                  };
                  picker = {
                    sources = {
                      explorer = {
                        auto_close = true;
                        layout = {
                          layout = {
                            position = "right";
                          };
                        };
                      };
                    };
                  };
                  indent = {
                    enabled = true;
                  };
                  lazygit = {
                    enabled = true;
                  };
                  notifier = {
                    enabled = true;
                    timeout = 5000;
                  };
                };
              };
            };
            ui = {
              noice = {
                enable = true;
              };
              breadcrumbs = {
                enable = true;
              };
              fastaction = {
                enable = true;
              };
            };
            comments = {
              comment-nvim = {
                enable = true;
              };
            };
            mini = {
              icons = {
                enable = true;
              };
            };
            debugger = {
              nvim-dap = {
                enable = true;
              };
            };
            extraPlugins = {
              autosave = {
                package = pkgs.vimPlugins.autosave-nvim;
                setup = "require('autosave').setup {}";
              };
            };
            keymaps = [
              {
                key = "J";
                mode = "v";
                action = ":m '>+1<CR>gv=gv";
              }
              {
                key = "K";
                mode = "v";
                action = ":m '<-2<CR>gv=gv";
              }
              {
                key = "<leader>qq";
                mode = "n";
                action = "<cmd>qa<CR>";
                desc = "Quit";
              }
              {
                key = "<leader>pv";
                mode = "n";
                action = "function() Snacks.explorer() end";
                lua = true;
                desc = "File Picker";
              }
              {
                key = "<leader>gI";
                mode = "n";
                action = "function() Snacks.picker.gh_issue() end";
                lua = true;
                desc = "Github Issues";
              }
              {
                key = "<leader>gP";
                mode = "n";
                action = "function() Snacks.picker.gh_pr() end";
                lua = true;
                desc = "Github Pull Requests";
              }
              {
                key = "<leader>gG";
                mode = "n";
                action = "function() Snacks.lazygit() end";
                lua = true;
                desc = "lazygit";
              }
              {
                key = "<leader>nh";
                mode = "n";
                action = "function() Snacks.notifier.show_history() end";
                lua = true;
                desc = "Notifications History";
              }
            ];
          };
        };
      };
    };
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home.file.".editorconfig".source = (pkgs.formats.ini { }).generate ".editorconfig" {
              "*" = {
                indent_style = "space";
                indent_size = 2;
                end_of_line = "lf";
                charset = "utf-8";
                trim_trailing_whitespace = true;
                insert_final_newline = true;
                max_line_width = 120;
              };
            };
          };
      };
    };
  };
}

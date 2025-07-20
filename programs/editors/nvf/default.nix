{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  program = "nvf";
  cfg = config.programs.editors.${program};
in
{
  imports = [ inputs.nvf.nixosModules.default ];
  options.programs.editors.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
    theme = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      name = lib.mkOption {
        type = lib.types.enum [
          null
          "base16"
          "catppuccin"
          "dracula"
          "everforest"
          "github"
          "gruvbox"
          "mini-base16"
          "nord"
          "onedark"
          "oxocarbon"
          "rose-pine"
          "solarized"
          "solarized-osaka"
          "tokyonight"
        ];
        default = null;
      };
      style = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
      transparent = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
    lsp = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      formatOnSave = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
    languages = {
      enableFormat = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      enableTreesitter = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      enableExtraDiagnostics = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
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
              enable = cfg.theme.enable;
              name = cfg.theme.name;
              style = cfg.theme.style;
              transparent = cfg.theme.transparent;
            };
            lsp = {
              enable = cfg.lsp.enable;
              formatOnSave = cfg.lsp.formatOnSave;
              lspSignature = {
                enable = true;
              };
              trouble = {
                enable = true;
              };
              mappings = {
                codeAction = "<leader>ca";
                format = "<leader>cf";
                goToDeclaration = "<leader>gD";
                goToDefinition = "<leader>gd";
                goToType = "<leader>gt";
              };
            };
            languages = {
              enableFormat = cfg.languages.enableFormat;
              enableTreesitter = cfg.languages.enableTreesitter;
              nix = {
                enable = config.programs.dev.nix.enable;
                extraDiagnostics = {
                  enable = cfg.languages.enableExtraDiagnostics;
                  types = [
                    "statix"
                    "deadnix"
                  ];
                };
                format = {
                  enable = cfg.languages.enableFormat;
                  package = pkgs.nixfmt-rfc-style;
                  type = "nixfmt";
                };
                lsp = {
                  enable = cfg.lsp.enable;
                  package = pkgs.nixd;
                  server = "nixd";
                };
                treesitter = {
                  enable = cfg.languages.enableTreesitter;
                  package = pkgs.vimPlugins.nvim-treesitter.builtGrammars.nix;
                };
              };
              python = {
                enable = config.programs.dev.python.enable;
                format = {
                  enable = cfg.languages.enableFormat;
                  type = "black";
                };
                lsp = {
                  enable = cfg.lsp.enable;
                  package = pkgs.basedpyright;
                  server = "basedpyright";
                };
                treesitter = {
                  enable = cfg.languages.enableTreesitter;
                  package = pkgs.vimPlugins.nvim-treesitter.builtGrammars.python;
                };
              };
              ts = {
                enable = config.programs.dev.nodejs.enable;
                extraDiagnostics = {
                  enable = cfg.languages.enableExtraDiagnostics;
                  types = [ "eslint_d" ];
                };
                format = {
                  enable = cfg.languages.enableFormat;
                  package = pkgs.prettier;
                  type = "prettier";
                };
                lsp = {
                  enable = cfg.lsp.enable;
                  package = pkgs.typescript-language-server;
                  server = "ts_ls";
                };
                treesitter = {
                  enable = cfg.languages.enableTreesitter;
                  jsPackage = pkgs.vimPlugins.nvim-treesitter.builtGrammars.javascript;
                  tsPackage = pkgs.vimPlugins.nvim-treesitter.builtGrammars.tsx;
                };
              };
            };
            statusline = {
              lualine = {
                enable = true;
                theme = cfg.theme.name;
              };
            };
            visuals = {
              nvim-web-devicons = {
                enable = true;
              };
              nvim-cursorline = {
                enable = true;
              };
              fidget-nvim = {
                enable = true;
              };
              highlight-undo = {
                enable = true;
              };
              indent-blankline = {
                enable = true;
              };
            };
            autopairs = {
              nvim-autopairs = {
                enable = true;
              };
            };
            autocomplete = {
              nvim-cmp = {
                enable = true;
              };
            };
            tabline = {
              nvimBufferline = {
                enable = true;
              };
            };
            binds = {
              whichKey = {
                enable = true;
              };
              cheatsheet = {
                enable = true;
              };
            };
            telescope = {
              enable = true;
            };
            git = {
              enable = false;
              gitsigns = {
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
            };
            terminal = {
              toggleterm = {
                enable = true;
                lazygit = {
                  enable = true;
                };
              };
            };
            ui = {
              noice = {
                enable = true;
              };
              colorizer = {
                enable = true;
              };
              illuminate = {
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
          };
        };
      };
    };
    home-manager.users.kathund =
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
}

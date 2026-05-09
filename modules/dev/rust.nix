{
  config,
  lib,
  username,
  ...
}:
let
  program = "rust";
  cfg = config.modules.dev.${program};
in
{
  options.modules.dev.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    nvf = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.nvf.settings.vim.languages.rust = lib.mkIf cfg.nvf {
      enable = true;
      dap.enable = true;
      format = {
        enable = true;
        type = [ "rustfmt" ];
      };
      lsp.enable = true;
      treesitter.enable = true;
    };
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ rustup ];
      };
  };
}

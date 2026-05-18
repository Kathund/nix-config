{
  config,
  inputs,
  lib,
  username,
  ...
}:
let
  program = "nix";
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
    programs.nvf.settings.vim.languages.${program} = lib.mkIf cfg.nvf {
      enable = true;
      format.type = [ "nixfmt" ];
    };
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        programs = {
          nix-your-shell.enable = true;
          nix-index.enable = true;
        };
        home.packages = with pkgs; [
          nixfmt
          nixfmt-tree
          nixd
          compose2nix
        ];
        nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      };
  };
}

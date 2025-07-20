{
  config,
  inputs,
  lib,
  ...
}:
let
  program = "nix";
  cfg = config.programs.dev.${program};
in
{
  options.programs.dev.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.kathund =
      { pkgs, ... }:
      {
        programs = {
          nix-your-shell = {
            enable = true;
          };
          nix-index = {
            enable = true;
          };
        };
        home = {
          packages = with pkgs; [
            nixfmt-rfc-style
            nixfmt-tree
            nixd
            compose2nix
          ];
        };
        nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      };
  };
}

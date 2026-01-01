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
    };
  };
}

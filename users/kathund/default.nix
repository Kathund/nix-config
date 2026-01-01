{
  inputs,
  pkgs,
  username,
  ...
}:

{
  users = {
    users = {
      ${username} = {
        isNormalUser = true;
        description = username;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        shell = pkgs.zsh;
        packages = with pkgs; [ ];
      };
    };
  };

  programs = {
    zsh = {
      enable = true;
    };
  };

  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      ${username} = {
        home = {
          username = username;
          homeDirectory = "/home/${username}";
          stateVersion = "25.05";
        };
        programs = {
          home-manager = {
            enable = true;
          };
        };
      };
    };
  };
}

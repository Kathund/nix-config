{
  lib,
  ...
}:
{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    settings = {
      experimental-features = lib.mkDefault [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (pkg: true);
    };
  };
}

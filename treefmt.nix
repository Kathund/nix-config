{
  projectRootFile = "flake.nix";
  programs = {
    nixfmt = {
      enable = true;
      strict = true;
      width = 100;
      indent = 2;
    };
    deadnix = {
      enable = true;
    };
    keep-sorted = {
      enable = true;
      includes = [ "*" ];
    };
    prettier = {
      enable = true;
      settings = {
        editorconfig = true;
      };
    };
    shellcheck = {
      enable = true;
    };
    shfmt = {
      enable = true;
      indent_size = 2;
    };
    statix = {
      enable = true;
    };
  };
}

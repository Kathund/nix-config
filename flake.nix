{
  description = "meow :3";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    split-monitor-workspaces = {
      url = "github:zjeffer/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    prismlauncher = {
      url = "github:PrismLauncher/PrismLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pipeweaver = {
      url = "github:BridgeSenseDev/nixpkgs/pipeweaver-init";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    packwiz = {
      url = "github:polyfrost/packwiz/91963c904dce0ec6d62209b1dceda39f69860d9b";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spotatui = {
      url = "github:LargeModGames/spotatui";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixmate = {
      url = "github:daskladas/nixmate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dix = {
      url = "github:faukah/dix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      username = "kathund";
      mkPkgs = system: import nixpkgs { inherit system; };

      nixosMachine =
        { machine }:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs machine username; };
          modules = [
            ./machines/common
            ./machines/${machine}
            ./modules
            ./users/${username}
          ];
        };
      system = "x86_64-linux";
      pkgs = mkPkgs system;
      treefmt = inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
    in
    {
      formatter.${system} = treefmt.config.build.wrapper;
      checks.formatting = treefmt.config.build.check inputs.self;
      nixosConfigurations = {
        snowball = nixosMachine { machine = "snowball"; };
        toffee = nixosMachine { machine = "toffee"; };
      };
    };
}

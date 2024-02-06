{ description = "Jules de Cube Home Manager configuration";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    home-manager = {
      url = github:nix-community/home-manager;
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    flake-utils = {
      url = github:numtide/flake-utils;
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils }:
  flake-utils.lib.eachDefaultSystem ( system:
  let 
    pkgs = import nixpkgs { inherit system; };
  in
  {
    packages.homeConfigurations = {
      jules = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
          {
            home = {
              username = "jules";
              homeDirectory = "/home/jules";
            };
          }
        ];
      };
    };
  });
}

{ pkgs, lib, config, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "kitty";
  };

  home.packages = import ./packages.nix { inherit pkgs; };

  gtk.enable = true;
  gtk.theme = {
    package = pkgs.sweet;
    name = "Sweet-mars";
  };

  xsession.windowManager.i3 = import ./i3_sway.nix { inherit pkgs lib config; };

  services = import ./services { inherit pkgs lib; };

  programs = import ./programs { inherit pkgs lib config; };

  home.file = { } // import ./programs/vim/files.nix;

  home.stateVersion = "22.11";
}

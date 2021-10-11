{pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "kitty";
    CFLAGS = "-Wall -Wextra -Werror -std=c99 -pedantic -fsanitize=address -g";
  };

  home.packages = import ./packages.nix { inherit pkgs; };

  fonts.fontconfig.enable = true;

  programs = import ./programs {inherit pkgs; inherit lib; };
  home.file = import ./programs/vim/home_files.nix;
}

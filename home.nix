{pkgs, lib, config, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "kitty";
    CFLAGS = "-Wall -Wextra -Werror -std=c99 -pedantic -fsanitize=address -g -Og";
    LDFLAGS = "-fsanitize=address";
  };

  home.packages = import ./packages.nix { inherit pkgs; };
  xsession.windowManager.i3 = import ./i3.nix { inherit pkgs; inherit lib; inherit config; };

  fonts.fontconfig.enable = true;

  programs = import ./programs {inherit pkgs; inherit lib; };
  home.file = import ./programs/vim/home_files.nix;
}

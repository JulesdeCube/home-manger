{ pkgs, lib, config, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "kitty";
    CFLAGS =
      "-Wall -Wextra -Werror -std=c99 -pedantic -fsanitize=address -g -Og";
    LDFLAGS = "-fsanitize=address";
  };

  home.packages = import ./packages.nix { inherit pkgs; };
  gtk.enable = true;
  gtk.theme = {

    package = pkgs.sweet;
    name = "Sweet-mars";
  };

  xsession.windowManager.i3 = import ./i3_sway.nix {
    inherit pkgs;
    inherit lib;
    inherit config;
  };
  # xsession.windowManager.bspwm.enable = true;
  # services.sxhkd.enable = true;
  # services.sxhkd.keybindings = {
  #   "super + Return" = "kitty";
  #   "super + @space" = "dmenu_run";
  #   "super + shift + r" = "pkill -USR1 -x sxhkd";
  #
  #   "super + {_,shift +} q" = "bspc node -{c,k}";
  # };
  services = import ./services {
    inherit pkgs;
    inherit lib;
  };

  fonts.fontconfig.enable = true;

  programs = import ./programs {
    inherit pkgs;
    inherit lib;
  };

  home.file = { } // import ./programs/vim/files.nix;
}

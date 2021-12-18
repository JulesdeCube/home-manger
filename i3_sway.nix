{ pkgs, lib, config, ... }:
let
  background = builtins.toString ./background.png;
  gaps = {
    inner = 16;
    outer = -4;
  };
in
{
  # wrapperFeatures.gtk = true ;

  enable = true;
  extraConfig = ''
    default_border pixel 1
    default_floating_border pixel 1
    for_window [class=".*"] border_radius 12'';
  config = {
    modifier = "Mod4";
    focus.followMouse = false;
    startup = [
      # setup: background
      {
        command = "${pkgs.feh}/bin/feh --bg-fill ${background}";
      }
      # setup: make caps lock an escape key
      {
        command =
          ''${pkgs.xorg.setxkbmap}/bin/setxkbmap -option "caps:escape"'';
      }
      # reload poly bar
      {
        command = "systemctl --user restart polybar";
        always = true;
      }
      { command = "exec i3-msg workspace 1"; }
    ];

    # disable i3 bar (use poly bat)
    bars = [ ];

    gaps = gaps;

    terminal = "kitty";

    keybindings =
      let modifier = config.xsession.windowManager.i3.config.modifier;
      in
      lib.mkOptionDefault {
        # close window
        "${modifier}+Shift+q" = "kill";
        # disable dmenu on mod+d
        "${modifier}+d" = null;
        # lock screen
        "${modifier}+Ctrl+Shift+l" =
          "exec i3lock -i ~/.config/nixpkgs/background.png";
        # lock
        "${modifier}+Ctrl+Shift+Return" =
          "exec ${pkgs.rofi}/bin/rofi -no-lazy-grab -show drun -modi drun -theme /home/jules/.config/rofi/test";
        "${modifier}+Shift+r" = "mode resize";
        "${modifier}+Ctrl+Shift+r" = "restart";

        "${modifier}+l" = "focus right";
        "${modifier}+k" = "focus up";
        "${modifier}+j" = "focus down";
        "${modifier}+h" = "focus left";

        "${modifier}+Shift+l" = "move right";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+h" = "move left";

        "${modifier}+n" = "exec ${pkgs.polybar}/bin/polybar-msg cmd toggle";
        "${modifier}+Shift+n" = "gaps inner current toggle 10";
      };

    window.border = 1;
    window.commands = [
      # { command = "border pixel 1"; }
    ];

  };
}

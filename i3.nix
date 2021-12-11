{pkgs, lib, config, ... }:
{

  enable = true;
  extraConfig = "default_border pixel 1\ndefault_floating_border pixel 1"; 
  config = {
    modifier = "Mod4";
    focus.followMouse = false;

    gaps = {
      inner = 12;
    };

    terminal = "kitty";

    keybindings = let
      modifier = config.xsession.windowManager.i3.config.modifier;
    in lib.mkOptionDefault {
      "${modifier}+Shift+q" = "kill";
      "${modifier}+d" = null;
      "${modifier}+m" = "exec i3lock -i ~/.config/nixpkgs/background.png";
      "${modifier}+r" = "exec ${pkgs.dmenu}/bin/dmenu_run";
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
    };

    window.border = 1;
    window.commands =[
      # { command = "border pixel 1"; } 
    ];

  };
}

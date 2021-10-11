{pkgs, lib, ... }:
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

      "${modifier}+semicolon" = "focus right";
      "${modifier}+l" = "focus up";
      "${modifier}+k" = "focus down";
      "${modifier}+j" = "focus left";

      "${modifier}+Shift+semicolon" = "move right";
      "${modifier}+Shift+l" = "move up";
      "${modifier}+Shift+k" = "move down";
      "${modifier}+Shift+j" = "move left";
    };

    window.border = 1;
    window.commands =[
      # { command = "border pixel 1"; } 
    ];

  };
}

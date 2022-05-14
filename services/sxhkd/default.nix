{ }: {
  enable = true;
  keybindings = {
    "super + Return" = "kitty";
    "super + @space" = "dmenu_run";
    "super + shift + r" = "pkill -USR1 -x sxhkd";
    "super + {_,shift +} q" = "bspc node -{c,k}";
    # todo fix this
    "super + @r" = "~/.config/bspwm/bspwmrc";
    "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
    "super + {_,shift + }{h,j,k,l}" =
      "bspc node -{f,s} {west,south,north,east}";
  };
}

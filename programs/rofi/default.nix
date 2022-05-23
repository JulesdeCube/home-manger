{ pkgs, lib, config }: {
  enable = true;

  font = "Iosevka Nerd Font 10";
  terminal = "${pkgs.kitty}/bin/kitty";

  cycle = true;

  location = "bottom-left";
  xoffset = 0;
  yoffset = -44;
  extraConfig = {
    show-icons = true;
    icon-theme = "Papirus";
    display-drun = "";
    drun-display-format = "{name}";
    disable-history = false;
    sidebar-mode = true;
  };

  theme = import ./theme.nix { inherit config lib; };
}

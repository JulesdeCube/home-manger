{ pkgs, ... }:
with pkgs; [
  # Terminal
  # shell
  fish
  starship

  # commmon
  bat

  # network
  dig
  tcpdump
  nmap

  # Graphical
  # common
  firefox
  vscode
  kitty
  obsidian

  # security
  keeweb

  # screenshot
  flameshot
  xclip

  # utils
  gnome.gnome-keyring
  pavucontrol

  # communication
  discord
  thunderbird

  (nerdfonts.override { fonts = [ "Iosevka" "FiraCode" "SourceCodePro" ]; })
]

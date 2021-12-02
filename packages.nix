{ pkgs, ... }:
with pkgs; [
  fish
  starship

  bat

  firefox
  vscode
  kitty

  jetbrains.rider
  dotnet-sdk_5
  mono

  gimp
  vlc

  # juno-theme
  # vimix-gtk-themes
  # orchis
  sweet
  # bibata-cursors-translucent
  bibata-cursors
  capitaine-cursors
  gnome.gnome-tweaks

  discord
  slack
  thunderbird
  teams

  (nerdfonts.override { fonts = [ "FiraCode" ]; })
]

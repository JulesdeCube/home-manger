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

  evince
  gimp
  vlc

  # bibata-cursors-translucent
  bibata-cursors
  capitaine-cursors
  gnome.gnome-tweaks
  gnome.gnome-keyring
  pavucontrol

  discord
  slack
  thunderbird
  teams

  (nerdfonts.override { fonts = [ "Iosevka" "FiraCode" ]; })
]

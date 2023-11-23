{ pkgs, ... }:
with pkgs; [
  fish
  starship

  bat

  firefox
  vscode
  kitty

  # jetbrains.rider
  # jetbrains.idea-ultimate
  # dotnet-sdk_5
  # mono

  # jdk
  # maven

  # python310

  # evince
  gimp
  vlc

  flameshot

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

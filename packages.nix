{ pkgs, ... }:
with pkgs; [
  fish
  starship

  bat

  firefox
  vscode
  kitty
  obsidian


  # jetbrains.rider
  # jetbrains.idea-ultimate
  # dotnet-sdk_5
  # mono

  # jdk
  # maven

  # python310

  # postman
  dig
  tcpdump
  nmap

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

  (nerdfonts.override { fonts = [ "Iosevka" "FiraCode" ]; })
]

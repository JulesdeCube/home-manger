{ pkgs, ... }:
with pkgs; [
    bat

    firefox
    vscode
    kitty

    # juno-theme
    # vimix-gtk-themes
    # orchis
    sweet
    gnome.gnome-tweaks

    discord
    slack

    starship
    clang-tools # move to a nix-shell

    (nerdfonts.override { fonts = [ "FiraCode" ]; })
]
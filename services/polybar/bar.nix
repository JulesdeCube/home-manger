{ lib, ... }:
let color = import ../../colors.nix // { transparent = "#00000000"; };
in
{
  "bar/main" = {
    monitor = "eDP-1";
    monitor-strict = false;

    # override-redirect = true
    wm-restack = "i3";

    background = color.transparent;
    foreground = color.foreground;
    fixed-center = true;
    bottom = true;
    width = "100%";
    height = 24;
    radius = 0.0;
    offset-y = 0;
    offset-x = 0;
    padding = 0;
    line-size = 3;
    border-top-size = 0;
    border-top-color = color.transparent;
    border-bottom-size = 10;
    border-bottom-color = color.transparent;

    #modules-left = "menu-power right space right menu-apps title right";
    modules-left = "menu-power right space left title right";
    # modules-center = "left bspwm right";
    modules-center = "left i3 right";
    modules-right = "left " + (lib.concatStringsSep " fill " [
      "cpu"
      "memory"
      "network"
      "backlight"
      "pulseaudio"
      "battery"
    ]) + " right space left date right space left";
    # left backlight right space left battery right space

    tray-detached = false;
    module-margin = 0;
    tray-position = "right";
    tray-maxsize = 15;
    tray-background = color.background;
    tray-offset-x = 0;
    tray-offset-y = 0;
    tray-padding = 0;
    tray-scale = 1.0;

    enable-ipc = true;
  } // (import ./font.nix);

  settings = {
    throttle-output = 5;
    throttle-output-for = 10;
    screenchange-reload = true;
    pseudo-transparency = false;
  };
}

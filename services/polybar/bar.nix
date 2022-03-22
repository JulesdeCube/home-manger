{ lib, ... }:
let
  color = import ../../colors.nix // { transparent = "#00000000"; };
  font =  import ./font.nix;
in
let
  common = {
    # override-redirect = true
    wm-restack = "i3";

    background = color.transparent;
    foreground = color.foreground;
    border-top-color = color.transparent;
    border-bottom-color = color.transparent;

    fixed-center = true;

    width = "100%";
    height = 24;
    radius = 0.0;

    offset-y = 0;
    offset-x = 0;

    padding = 0;
    module-margin = 0;

    line-size = 3;
  } // font;
in
let
  bar = monitor: bottom: {
    monitor = monitor;

    modules-left = "";
    modules-center = "left i3 right";
    modules-right = "";

    bottom = bottom;

    border-bottom-size = if bottom then 10 else 0;
    border-top-size = if bottom then 0 else 10;
  } // common;
in
{
  "bar/top" = bar "VGA1" false;
  "bar/left" = bar "HDMI-0" true;
  "bar/right" = bar "DP1" true;

  "bar/main" = (bar "DP2" true) // {

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
    tray-position = "right";
    tray-maxsize = 15;
    tray-background = color.background;
    tray-offset-x = 0;
    tray-offset-y = 0;
    tray-padding = 0;
    tray-scale = 1.0;

    enable-ipc = true;
  };

  settings = {
    throttle-output = 5;
    throttle-output-for = 10;
    screenchange-reload = true;
    pseudo-transparency = false;
  };
}

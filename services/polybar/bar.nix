{ lib, ... }:
let
  color = import ../../colors.nix // { transparent = "#00000000"; };
  font = import ./font.nix;
in
let
  common = {

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
  "bar/DP1-1" = bar "DP1-1" true;
  "bar/DP1-2" = bar "DP1-2" true;
  "bar/DP1-3" = bar "DP1-3" true;

  "bar/DP2-1" = bar "DP2-1" true;
  "bar/DP2-2" = bar "DP2-2" true;
  "bar/DP2-3" = bar "DP2-3" true;

  "bar/DP3-1" = bar "DP3-1" true;
  "bar/DP3-2" = bar "DP3-2" true;
  "bar/DP3-3" = bar "DP3-3" true;

  "bar/DP1" = bar "DP1" true;
  "bar/DP2" = bar "DP2" true;
  "bar/DP3" = bar "DP3" true;

  "bar/eDP1" = (bar "eDP1" true) // {

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
    ]) + " right space left date right space left tray";
    # left backlight right space left battery right space

    enable-ipc = true;
  };

  settings = {
    screenchange-reload = true;
    pseudo-transparency = false;
  };
}

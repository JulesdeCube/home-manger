{ pkgs, lib, ... }:
let
  polybar = pkgs.polybar.override {
    i3Support = true;
    i3GapsSupport = true;
    pulseSupport = true;
    # alsaSupport = true;
    # pulseaudioSupport = true;
    # "internal/pulseaudio" = true;
    # iwSupport = true;
    # githubSupport = true;
  };
in
{
  enable = true;
  package = polybar;
  settings = (import ./bar.nix) { inherit lib; } // (import ./module.nix);

  script = ''
    for display in $(${pkgs.xorg.xrandr}/bin/xrandr --listactivemonitors | ${pkgs.coreutils}/bin/tail -n +2 | ${pkgs.gnugrep}/bin/grep -oE '[^ ]+$'); do
    ${polybar}/bin/polybar $display &
    done;
  '';
}

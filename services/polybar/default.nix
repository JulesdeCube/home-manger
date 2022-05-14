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

  script = "polybar main &";
}

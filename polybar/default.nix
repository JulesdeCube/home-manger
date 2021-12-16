{ pkgs, lib, ... }:
{
  enable = true;
  package = pkgs.polybar.override {
    i3Support = true;
    i3GapsSupport = true;
    pulseSupport = true;
    # alsaSupport = true;
    # pulseaudioSupport = true;
    # "internal/pulseaudio" = true;
    iwSupport = true;
    # githubSupport = true;
  };

  settings = (import ./bar.nix) { inherit lib; } // (import ./color.nix) // (import ./module.nix);

  script = "polybar main &";
}

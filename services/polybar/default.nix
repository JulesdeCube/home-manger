{ pkgs, lib, ... }: {
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

  # transparent = "#00000000";
  settings = (import ./bar.nix) { inherit lib; } // (import ./module.nix);

  script = "polybar main &";
}

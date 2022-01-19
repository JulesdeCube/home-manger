{ ... }: {
  enable = true;
  # experimentalBackends = true;
  # backend = "glx";
  # enable by default
  # blur = true;
  shadow = true;
  shadowOffsets = [ (-22) (-22) ];
  shadowOpacity = "0.25";
  extraOptions = ''
    shadow-radius = 32;
    corner-radius = 8.0;
  '';

  # extraOptions = ''
  #   shadow-radius = 64;
  #   blur:
  #   {
  #       method = "gaussian";
  #       size = 64;
  #       deviation = 5.0;
  #   };
  #   corner-radius = 9.0;
  # '';


  fade = true;
  fadeDelta = 3;

  # Blur background of opaque windows with transparent frames as well.
  # blur-background-frame = true;
  # Do not let blur radius adjust based on window opacity.
  # blur-background-fixed = true;
  # blur =
  # {
  #     method = "dual_kawase";
  #     strength = 10;
  # };
  #blur-background-exclude = [
  # "window_type = 'dock'",
  # "window_type = 'desktop'"
  #];
}

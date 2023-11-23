{ ... }: {
  enable = true;
  shadow = true;
  shadowOffsets = [ (-22) (-22) ];
  shadowOpacity = 0.25;

  settings = {
    inactive-dim = 0.15;
    shadow-radius = 32;
    corner-radius = 8.0;
    detect-rounded-corners = true;
    shadow-ignore-shaped = false;

    rounded-corners-exclude = [
      "class_g = 'Polybar'"
      "class_g = 'tray'"
      "class_g = 'Dunst'"
    ];
  };

  fade = false;
  fadeDelta = 3;
}

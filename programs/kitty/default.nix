{
  enable = true;

  settings = {
    # wayland_titlebar_color = "background";
    hide_window_decorations = true;
    enable_audio_bell = false;

    font_size = "9.0";
    font_family = "Fira Code Medium Nerd Font Complete";
    bold_font = "Fira Code Bold Nerd Font Complete";
    italic_font = "Source Code Pro Medium Italic";
    bold_italic_font = "Source Code Pro Black Italic";

    cursor = "#cccccc";
    cursor_shape = "beam";
    cursor_blink_interval = "1";

    url_color = "#0087bd";
    url_style = "curly";

    window_border_width = "0.25pt";
    window_padding_width = "5";
    draw_minimal_borders = true;

    inactive_border_color = "#1d2126";
    active_border_color = "#0366d6";

    confirm_os_window_close = 0;

  } // import ../../colors.nix;
}

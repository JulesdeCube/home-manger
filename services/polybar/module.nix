let color = import ../../colors.nix;
in
{
  "module/title" = {
    type = "internal/xwindow";
    format-background = color.background;
    format-padding = 1;

    label-empty = "Desktop";
    label-maxlen = 42;
  };

  "module/menu-apps" = {
    type = "custom/menu";

    format-background = color.background;
    format-padding = 1;

    label-open = "%{T3}%{T-}";
    label-close = "%{F${color.color1}}%{T3}%{F-}%{T-}";
    label-separator = " ";

    # If true, <label-toggle> will be to the left of the menu items (default).
    # If false, it will be on the right of all the items.
    expand-right = true;

    # "menu-LEVEL-N" has the same properties as "label-NAME" with
    # the additional "exec" property
    #
    # Commands will be executed using "/bin/sh -c \$COMMAND"

    menu-0-0 = "Browsers";
    menu-0-0-exec = ""; # menu-apps.open.1
    menu-0-1 = "Multimedia";
    menu-0-1-exec = ""; # menu-apps.open.2

    menu-1-0 = "Firefox";
    menu-1-0-exec = "firefox";
    menu-1-1 = "Chromium";
    menu-1-1-exec = "chromium";

    menu-2-0 = "Gimp";
    menu-2-0-exec = "gimp";
    menu-2-1 = "Scrot";
    menu-2-1-exec = "scrot";
  };

  "module/menu-power" = {
    type = "custom/menu";

    format-background = color.background;
    format-padding = 1;

    label-open = "%{T3}%{T-}";
    # label-open = "%{F#FA5A77}%{T3}%{F-}%{T-}";
    label-close = "%{T4} %{T-}";
    label-separator = " ";

    # If true, <label-toggle> will be to the left of the menu items (default).
    # If false, it will be on the right of all the items.
    expand-right = "true";

    # "menu-LEVEL-N" has the same properties as "label-NAME" with
    # the additional "exec" property
    #
    # Commands will be executed using "/bin/sh -c \$COMMAND"

    menu-0-0 = "%{F${color.color1}}%{T4}%{F-}%{T-}";
    menu-0-0-exec = "poweroff";
    menu-0-1 = "%{F${color.color2}}%{T4}%{F-}%{T-}";
    menu-0-1-exec = "reboot";
    menu-0-2 = "%{F${color.color3}}%{T4}%{F-}%{T-}";
    menu-0-2-exec = "lock";
    menu-0-3 = "%{F${color.color0}}%{T4}鈴%{F-}%{T-}";
    menu-0-3-exec = "systemctl suspend";

  };

  "module/i3" = {
    type = "internal/i3";
    format-background = color.background;
    format = "<label-mode>%{T2}<label-state>%{T-}";
    pin-workspaces = "true";

    # resize
    label-mode = "%{T1}%mode%%{T-}";
    label-mode-foreground = color.color1;

    label-focused-foreground = color.color1;
    label-visible-foreground = color.color7;
    label-unfocused-foreground = color.color8;
    label-urgent-foreground = color.color9;

    label-visible-underline = color.color7;
    label-focused-underline = color.color1;
    label-unfocused-underline = color.background;

    label-focused-padding = 1;
    label-unfocused-padding = 1;
    label-visible-padding = 1;
    label-urgent-padding = 1;

    label-focused = "%{T4}%icon%%{T-}";
    label-unfocused = "%{T4}%icon%%{T-}";
    label-visible = "%{T4}%icon%%{T-}";
    label-urgent = "%{T4}%icon%%{T-}";

    ws-icon-0 = "1;";
    ws-icon-1 = "2;";
    ws-icon-2 = "3;爵";
    ws-icon-3 = "4;";
    # ws-icon-4 = "5;ﭮ";
    ws-icon-default = "";

  };

  "module/left" = {
    type = "custom/text";

    content = "%{T2}%{T-}";
    content-foreground = color.background;

  };

  "module/right" = {
    type = "custom/text";

    content = "%{T2}%{T-}";
    content-foreground = color.background;

  };

  "module/fill" = {
    type = "custom/text";
    content = "  ";
    content-background = color.background;
  };

  "module/space" = {
    type = "custom/text";
    content = " ";
  };

  "module/date" = {
    type = "internal/date";
    format-background = color.background;

    time = "%{T3}%{F${color.color1}}%{T-}%{F-} %H:%M:%S";
    format = " <label>";
    label = "%time%";
    interval = "1.0";

    time-alt = "%{T3}%{F${color.color1}}%{T-}%{F-} %Y/%m/%d";

  };

  "module/battery" = {
    type = "internal/battery";
    battery = "BAT0";
    adapter = "AC";
    full-at = 100;
    format-background = color.background;

    # format-charging = "%{T1}%{F#6381EA}<animation-charging>⚡ %{F-}%{T-}<label-charging>";
    # format-discharging = "%{T1}%{F#6381EA}<ramp-capacity>%{T3} %{F-}%{T-}<label-discharging>";
    format-discharging = "%{T5}<ramp-capacity>%{F-}%{T-} <label-discharging>";
    # format-discharging = " <label-discharging>";
    format-charging =
      "%{T5}<ramp-capacity>%{T6} %{T2}%{F-}%{T-} <label-charging>";
    # format-discharging = " <label-discharging>";
    format-full = "%{T5}%{F${color.color2}}%{T6} %{F-}%{T-}<label-full>";
    label-charging = "%percentage%%";
    label-discharging = "%percentage%%";

    format-charging-foreground = color.foreground;
    format-discharging-foreground = color.foreground;
    format-full-foreground = color.foreground;

    format-charging-background = color.background;
    format-discharging-background = color.background;
    format-full-background = color.background;

    ramp-capacity = [
      "%{F${color.color1}}"
      "%{F${color.color1}}"
      "%{F${color.color1}}"
      "%{F${color.color3}}"
      "%{F${color.color3}}"
      "%{F${color.color3}}"
      "%{F${color.color3}}"
      "%{F${color.color3}}"
      "%{F${color.color2}}"
      "%{F${color.color2}}"
      "%{F${color.color2}}"
    ];

    animation-charging-0 = "";
    animation-charging-1 = "";
    animation-charging-2 = "";
    animation-charging-3 = "";
    animation-charging-4 = "";
  };

  "module/pulseaudio" = {
    type = "internal/pulseaudio";

    format-volume =
      "%{T3}%{F${color.color4}}<ramp-volume>%{F-}%{T-} <label-volume>";
    format-muted-prefix = "%{T3}%{F${color.color1}}ﱝ%{F-}%{T-}";
    label-muted = " Mute";
    format-volume-foreground = color.foreground;
    format-muted-foreground = color.foreground;
    format-volume-background = color.background;
    format-muted-background = color.background;

    ramp-volume-0 = "";
    ramp-volume-1 = "";
    ramp-volume-2 = "墳";

  };

  "module/backlight" = {
    type = "internal/backlight";

    card = "intel_backlight";
    enable-scroll = "true";
    use-actual-brightness = true;
    format = "%{T3}%{F${color.color7}}%{F-}%{T-} <label>";
    label = "%percentage%%";
    format-foreground = color.color11;
    format-background = color.background;

  };

  "module/cpu" = {
    type = "internal/cpu";
    format-background = color.background;

    format = "%{T4}%{F${color.color3}}%{T-}%{F-} <label>";
  };

  "module/memory" = {
    type = "internal/memory";
    interval = 3;
    format = "%{T4}%{F${color.color5}}%{T-}%{F-} <label>";
    format-background = color.background;

    label = "%percentage_used%%";
  };

  "module/mpd" = {
    type = "internal/mpd";

    format-online = " <label-song> <bar-progress>";
    label-song = "%artist% - %title%";
    label-offline = "";
    label-song-maxlen = 30;
    format-online-foreground = color.color3;
    label-song-foreground = color.foreground;
    format-online-margin = 1;

    bar-progress-width = 10;
    bar-progress-indicator = "";
    bar-progress-fill = "━";
    bar-progress-fill-foreground = color.color3;
    bar-progress-empty = "━";
    bar-progress-empty-foreground = color.foreground;

  };

  "module/network" = {
    type = "internal/network";
    interface = "wlp0s20f3";

    format-disconnected-background = color.background;
    format-connected-background = color.background;
    format-disconnected-padding = 1;

    label-connected = " %downspeed%";
    label-disconnected = "no eth";
    label-disconnected-foreground = color.color1;

    format-connected = "%{T3}%{F${color.color6}}%{T-}%{F-} <label-connected>";
  };
}

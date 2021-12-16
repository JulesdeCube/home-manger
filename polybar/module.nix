{
    "module/title" = {
        type = "internal/xwindow";
        format-background = "\${colors.background}";
        format-padding= 1;

        label-empty = "Desktop";
        label-maxlen = 42;
    };

    "module/menu-apps" = {
        type = "custom/menu";

        format-background = "\${colors.background}";
        format-padding= 1;

        label-open = "%{T3}%{T-}";
        label-close = "%{F#FA5A77}%{T3}%{F-}%{T-}";
        label-separator = " ";

        # If true, <label-toggle> will be to the left of the menu items (default).
        # If false, it will be on the right of all the items.
        expand-right = true;

        # "menu-LEVEL-N" has the same properties as "label-NAME" with
        # the additional "exec" property
        #
        # Commands will be executed using "/bin/sh -c \$COMMAND"

        menu-0-0 = "Browsers";
        menu-0-0-exec = "";#menu-apps.open.1
        menu-0-1 = "Multimedia";
        menu-0-1-exec = ""; #menu-apps.open.2

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

    format-background = "\${colors.background}";
    format-padding= 1;

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

    menu-0-0 = "%{F#FF5F5F}%{T4}%{F-}%{T-}";
    menu-0-0-exec = "poweroff";
    menu-0-1 = "%{F#2BE491}%{T4}%{F-}%{T-}";
    menu-0-1-exec = "reboot";
    menu-0-2 = "%{F#FFD75F}%{T4}%{F-}%{T-}";
    menu-0-2-exec = "lock";
    menu-0-3 = "%{F#434C5E}%{T4}鈴%{F-}%{T-}";
    menu-0-3-exec = "systemctl suspend";

    };

"module/i3" = {
    type = "internal/i3";
    format-background = "\${colors.background}";
    format = "<label-mode>%{T2}<label-state>%{T-}";
    pin-workspaces = "true";

    # resize
    label-mode = "%{T1}%mode%%{T-}";
    label-mode-foreground = "\${colors.color1}";

    label-focused-foreground = "\${colors.color1}";
    label-focused-underline = "\${colors.color1}";
    label-visible-foreground = "\${colors.color0}";
    label-visible-underline = "\${colors.color0}";

    label-urgent-foreground = "\${colors.color9}";

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
    content-foreground = "\${colors.background}";

    };

"module/right" = {
    type = "custom/text";

    content = "%{T2}%{T-}";
    content-foreground = "\${colors.background}";

    };

"module/fill" = {
    type = "custom/text";
    content =  "  ";
    content-background = "\${colors.background}";
    };

"module/space" = {
    type = "custom/text";
    content =  " ";
    };

"module/date" = {
    type = "internal/date";
    format-background = "\${colors.background}";

    time = "%{T3}%{F#FF5F5F}%{T-}%{F-} %H:%M";
    format = " <label>";
    label = "%time%";
    interval = "1.0";

    time-alt="%{T3}%{F#FF5F5F}%{T-}%{F-} %m/%d";


    };

"module/battery" = {
    type = "internal/battery";
    battery = "BAT0";
    adapter = "AC";
    full-at = 100;
    format-background = "\${colors.background}";

    # format-charging = "%{T1}%{F#6381EA}<animation-charging>⚡ %{F-}%{T-}<label-charging>";
    # format-discharging = "%{T1}%{F#6381EA}<ramp-capacity>%{T3} %{F-}%{T-}<label-discharging>";
    format-discharging = "%{T5}<ramp-capacity>%{F-}%{T-} <label-discharging>";
    # format-discharging = " <label-discharging>";
    format-charging = "%{T5}<ramp-capacity>%{T6} %{T2}%{F-}%{T-} <label-charging>";
    # format-discharging = " <label-discharging>";
    format-full = "%{T5}%{F#87D75F}%{T6} %{F-}%{T-}<label-full>";
    label-charging = "%percentage%%";
    label-discharging = "%percentage%%";

    format-charging-foreground = "\${colors.foreground}";
    format-discharging-foreground = "\${colors.foreground}";
    format-full-foreground = "\${colors.foreground}";

    format-charging-background = "\${colors.background}";
    format-discharging-background = "\${colors.background}";
    format-full-background = "\${colors.background}";

    ramp-capacity = [
        "%{F#FF5F5F}"
        "%{F#FF5F5F}"
        "%{F#FF5F5F}"
        "%{F#FFD75F}"
        "%{F#FFD75F}"
        "%{F#FFD75F}"
        "%{F#FFD75F}"
        "%{F#FFD75F}"
        "%{F#87D75F}"
        "%{F#87D75F}"
        "%{F#87D75F}"
    ];


    animation-charging-0 = "";
    animation-charging-1 = "";
    animation-charging-2 = "";
    animation-charging-3 = "";
    animation-charging-4 = "";
    };

"module/pulseaudio" = {
    type = "internal/pulseaudio";

    format-volume = "%{T3}%{F#5E65FE}<ramp-volume>%{F-}%{T-} <label-volume>";
    format-muted-prefix = "%{T3}%{F#FF5F5F}ﱝ%{F-}%{T-}";
    label-muted = " Mute";
    format-volume-foreground = "\${colors.foreground}";
    format-muted-foreground = "\${colors.foreground}";
    format-volume-background = "\${colors.background}";
    format-muted-background = "\${colors.background}";

    ramp-volume-0 = "";
    ramp-volume-1 = "";
    ramp-volume-2 = "墳";

    };

"module/backlight" = {
    type = "internal/backlight";

    card = "intel_backlight";
    enable-scroll = "true";
    use-actual-brightness = true;
    format = "%{T3}%{F#9FA8B9}%{F-}%{T-} <label>";
    label = "%percentage%%";
    format-foreground = "\${colors.color11}";
    format-background = "\${colors.background}";

    };

"module/cpu" = {
    type = "internal/cpu";
    format-background = "\${colors.background}";

    format = "%{T4}%{F#FFD75F}%{T-}%{F-} <label>";
    #  <ramp-coreload>

    ramp-coreload-spacing = 0;
    ramp-coreload-0 = "%{F#44EB9F}▁%{F-}";
    ramp-coreload-1 = "%{F#44EB9F}▂%{F-}";
    ramp-coreload-2 = "%{F#2BE491}▃%{F-}";
    ramp-coreload-3 = "%{F#2BE491}▄%{F-}";
    ramp-coreload-4 = "%{F#FA946E}▅%{F-}";
    ramp-coreload-5 = "%{F#FA946E}▆%{F-}";
    ramp-coreload-6 = "%{F#FA748D}▇%{F-}";
    ramp-coreload-7 = "%{F#FA5A77}█%{F-}";

    };

"module/memory" = {
    type = "internal/memory";
    interval = 3;
    format = "%{T4}%{F#CC5FFF}%{T-}%{F-} <label>";
    format-background = "\${colors.background}";

    label = "%percentage_used%%";
    format-foreground = "\${colors.color5}";

    };

"module/mpd" = {
    type = "internal/mpd";

    format-online = " <label-song> <bar-progress>";
    label-song = "%artist% - %title%";
    label-offline = "";
    label-song-maxlen = 30;
    format-online-foreground = "\${colors.color3}";
    label-song-foreground = "\${colors.foreground}";
    format-online-margin = 1;

    bar-progress-width = 10;
    bar-progress-indicator = "";
    bar-progress-fill = "━";
    bar-progress-fill-foreground = "\${colors.color3}";
    bar-progress-empty = "━";
    bar-progress-empty-foreground = "\${colors.foreground}";

    };

"module/network" = {
    type = "internal/network";
    interface = "wlp0s20f3";
    format-disconnected-background = "\${colors.background}";
    format-connected-background = "\${colors.background}";
    format-disconnected-padding = 1;

    label-connected = " %downspeed%";
    label-disconnected = "no eth";
    label-disconnected-foreground = "\${colors.color1}";

    format-connected = "%{T3}%{F#87AFFF}%{T-}%{F-} <label-connected>";
    };
}

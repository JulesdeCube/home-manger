{ lib, ... }:
let
  apply_style = style: value: "[${value}](${style})";

  bg_color = "black";
  apply_bg = apply_style bg_color;

  left_symbol =  "";
  right_symbol =  "";
  character_symbol = "➜";
  left = apply_bg left_symbol;
  right = apply_bg right_symbol;

  content_style =  color: "bg:${bg_color} fg:${color}";
  apply_content = color: apply_style (content_style color);
  apply_group = color: value: left + (apply_content color value) + right;

  mkEnv =  name: {color, symbol, override ? {}}: {
    format = " [$symbol($version)]($style)";
    style = content_style "${color} bold";
    version_format = "$raw";
    inherit symbol;
  } // override;

  envs = {
      buf = { color = "blue"; symbol = "🦬"; };
      # bun = {color = "red"; symbol = "🍞"; };
      c = { color = "149"; symbol = "C"; };
      cmake  = { color = "blue"; symbol = "△"; };
      cobol = {color = "blue"; symbol = "⚙️"; };
      conda = { color = "green"; symbol = "🇨"; };
      crystal = { color = "red"; symbol = "🔮"; };
      # daml = { color = "cyan"; symbol = "Λ";  };
      dart = { color = "blue"; symbol = "🎯"; };
      deno = { color = "green"; symbol = "🦕"; };
      dotnet = { color = "blue"; symbol = ".NET"; };
      elixir = { color = "purple"; symbol = "💧"; };
      elm = { color = "cyan"; symbol = "🌳"; };
      erlang = { color = "red"; symbol = "ҽ"; };
      golang = { color = "cyan"; symbol = "🐹"; };
      haskell = { color = "purple"; symbol = "λ"; };
      helm = { color = "white"; symbol = "⎈"; };
      java = { color = "red"; symbol = "☕"; };
      julia = { color = "purple"; symbol = "ஃ"; };
      kotlin = { color = "blue"; symbol = "🇰ₑ"; };
      lua = { color = "blue"; symbol = "🌙"; };
      nim = { color = "yellow"; symbol = "👑"; };
      nodejs = { color = "green"; symbol = ""; };
      ocaml = { color = "yellow"; symbol = "🐫"; };
      perl = { color = "149"; symbol = "🐪"; };
      php = { color = "147"; symbol = "🐘"; };
      pulumi = { color = "5"; symbol = ""; }; 
      purescript = { color = "white"; symbol = "⇄"; };
      python = {
        color = "green";
        symbol = "🐍";
        override.format = " [$symbol$pyenv_prefix($version )(\\($virtualenv\\))]($style)";
      };
      rlang = { color = "blue"; symbol = "📐"; };
      # raku = { color = "149"; symbol = "🦋"; };
      red = { color = "red"; symbol = "🔺"; };
      ruby = { color = "red"; symbol = "💎"; };
      rust = { color = "red"; symbol = "🦀"; };
      scala = { color = "202"; symbol = "🇸"; };
      swift = { color = "202"; symbol = "🐦"; };
      terraform = { color = "105"; symbol = "💠"; };
      vagrant = { color = "cyan"; symbol = "⍱"; };
      vlang = { color = "blue"; symbol = "V"; };
      zig = { color = "yellow"; symbol = "↯"; };

      package  = {
        color = "208";
        symbol = "📦"; 
        override.format = "[$symbol$version]($style) ";
      };
  };

  envsConfig = builtins.mapAttrs mkEnv envs;

in {
  enable = true;
  enableBashIntegration = true;
  enableFishIntegration = true;

  settings = envsConfig // (rec {
    add_newline = false;

    username = {
      style_user = content_style "yellow bold";
      style_root = content_style "red bold";
      # show_always = true;
    };
    
    sudo = {
      style = content_style "blue bold";
      disabled = true;
    };

    hostname = {
      # ssh_only = false;
      style = content_style "blue bold";
    };

    container = {
      style = content_style "red bold dim";
    };

    directory = {
      format ="[$path]($style)[$read_only]($read_only_style)";
      # home_symbol = "🏠";
      read_only_style = content_style "red bold";
      style =  content_style "cyan bold";
      # repo_root_style =  content_style "bright-cyan dim bold";
      truncation_length = 0;
    };


    git_branch = {
      format = " on [$symbol$branch(:$remote_branch)]($style)";
      symbol = "🌱 ";
      style = content_style "green bold";
      only_attached = true;
    };

    hg_branch = git_branch;

    git_commit = {
      format = " on [$hash$tag]($style)";
      style = content_style "green bold";
      tag_disabled = false;
    };

    git_state = rec {
      format = apply_group  "bright-white" "$state $progress_current/$progress_total";
      # style = "bg:${bg} fg:yellow bold ";
      rebase = apply_content "green bold" "♻️ rebase";
      merge = apply_content "green bold" "⚜️ merge";
      revert = apply_content "yellow bold" "↩️ merge";
      cherry_pick = apply_content "red bold" "🍒pick";
      bisect = apply_content "white bold" "↔️ bisect";
      am = apply_content "blue bold" "📩am";
      am_or_rebase = rebase + " or " + am;
    };

    git_status = {
      format = " " + apply_group "white bold" "$ahead_behind$all_status";
      conflicted = "💣$count";

      ahead = "📤$count ";
      behind = "📥$count ";
      diverged = "❗📤$ahead_count📥$behind_count ";
      up_to_date = "✅";

      stashed = apply_content "purple bold" "📦$count ";
      modified = apply_content "yellow bold" "📝$count";
      staged = apply_content "green bold" "➕$count";
      renamed = apply_content "blue bold" "🚚$count";
      deleted = apply_content "red bold" "🔥$count";
      untracked = " 🙈$count";
      # style = "bg:${bg} bold";
    };


    memory_usage = {
      format = " $symbol [$ram]($style)";
      style = content_style "white bold dimmed";
      symbol = "🧠";
      disabled = false;
    };


    character = rec {
      success_symbol = apply_style "green bold" "→";
      error_symbol = apply_style "red bold" "→";
      vicmd_symbol = apply_style "yellow bold" "←";
    };
    # character = rec {
    #   success_symbol = apply_style "green bold" character_symbol;
    #   error_symbol = success_symbol;
    #   vimcmd_symbol = success_symbol;
    #   vimcmd_replace_symbol = apply_style "red bold" character_symbol;
    #   # vimcmd_replace_one_symbol = vimcmd_replace_symbol;
    #   vimcmd_visual_symbol = apply_style "blue bold" character_symbol;
    # };

    battery = {
      format = " [$symbol$percentage]($style)";
      disabled = false;
      full_symbol = "🔋";
      charging_symbol = "⚡";
      discharging_symbol = "🪫";
      display = [
        {
          # charging_symbol = "⚡";
          # discharging_symbol = "☠️";
          threshold = 15;
          style = content_style "red bold";
        }
        {
          threshold = 90;
          style = content_style "white bold";
        }
        {
          threshold = 99;
          discharging_symbol = "🔋";
          charging_symbol = "🔋";
          style = content_style "green bold";
        }
      ];

    };

    jobs = {
      format = " " + apply_group "blue bold" "$symbol$number";
      style = content_style "blue bold";
      # style = content_style ;
    };

    fill = {
      symbol = " ";
    };

    time = {
      disabled = false;
      format = "[$time]($style)";
      time_format = "📅%m/%d ⌚%R";
      utc_time_offset = "+1";
      style = content_style "yellow bold";
      # time_range = "10:00:00-14:00:00";
    };

    cmd_duration = {
      format = " " + apply_group  "yellow bold" "⌛$duration";
      # style = content_style ;
      show_notifications = true;
    };

    status = {
      disabled = false;
      format =  " " + apply_group "red bold" "$symbol$common_meaning$signal_name$maybe_int";
      map_symbol = true;
      # style = content_style "red bold";
      symbol = "🔴";
    };

    nix_shell = {
      symbol = "⛄";
      format =  " " + apply_group "blue bold" "$symbol$name$state";
      # style = content_style "blue bold";
      impure_msg = "";
      pure_msg = " (pure)";
    };

    docker_context = {
      symbol = "🐳";
      format =  " " + apply_group "blue bold" "$symbol$context";
      # style = content_style "blue bold";
    };

    gcloud = {
      symbol = "☁️";
      format =  " " + apply_group "blue bold" "$symbol$account(@$domain)(\\($region\\))";
    };

    # TODO
    # kubernetes = {
    #   color = "cyan"; symbol = "C";
    # };

    singularity = {
      format =  " " + apply_group "blue dimmed bold" "$symbol\\[$env\\]";
    };

    spack = {
      symbol = "💠";
      format =  " " + apply_group "blue bold" "$symbol$environment";
    };

    openstack = {
      symbol = "☁️";
      format =  " " + apply_group "yellow bold" "$symbol$cloud(\\($project\\))";
    };


    format = lib.concatStrings [
       "$fill "

      "$status"
      "$cmd_duration"

      " $fill"
      "$line_break"


      (apply_group "bright-white" (lib.concatStrings [
        "$username"
        "$sudo"
        "$container"
        "$hostname"
        "$directory"
        "$hg_branch"
        "$git_branch"
        "$git_commit"
      ]))

      "$git_state"
      "$git_status"

      "$nix_shell"
      "$docker_context"
      "$container"
      "$gcloud"
      "$kubernetes"
      "$openstack"

      " "
      (apply_group "bright-white" (lib.concatStrings (map (name: "$" + name) (builtins.attrNames envs))))

      "$jobs"

      " $fill "

      "[[](black)"
      "$shlvl"
      "$time"
      "$memory_usage"
      "$battery"
      "[](black)](bg:black)"


      "$line_break"
      " "
      "$shell"
      "$character"
    ];
  }); 
}

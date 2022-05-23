{ config, lib }:
let
  inherit (config.lib.formats.rasi) mkLiteral;
  color = lib.mapAttrs (k: v: mkLiteral v) (
    import ../../colors.nix // {
      accent = "#FF5F5F";
      alternative = "#BBBBBB";
    }
  );
in
{
  window = {
    transparency = "real";
    background-color = color.background;
    text-color = color.foreground;
    border = mkLiteral "0px";
    border-color = color.accent;
    border-radius = mkLiteral "0px 16px 16px 0px";
    width = mkLiteral "18%";
    height = mkLiteral "50%";
    padding = mkLiteral "0.5%";
  };

  prompt = {
    enabled = true;
    padding = mkLiteral "0.00% 0.5% 0% 0%";
    background-color = color.background;
    text-color = color.foreground;
  };

  entry = {
    background-color = color.background;
    text-color = color.foreground;
    placeholder-color = color.alternative;
    expand = true;
    horizontal-align = 0;
    placeholder = "Search";
    padding = mkLiteral "0.0% 0% 0% 0%";
    blink = true;
  };

  inputbar = {
    children = [ "prompt" "entry" ];
    background-color = color.background;
    text-color = color.foreground;
    expand = false;
    border = mkLiteral "0% 0% 0% 0%";
    border-radius = mkLiteral "0px";
    border-color = color.accent;
    margin = mkLiteral "0% 0% 1% 0%";
    padding = mkLiteral "0.1%";
  };


  mainbox = {
    children = [ "inputbar" "listview" ];
    background-color = color.background;
    border = mkLiteral "0% 0% 0% 0%";
    border-radius = mkLiteral "0% 0% 0% 0%";
    border-color = color.background;
    spacing = mkLiteral "0%";
    padding = mkLiteral "0%";
  };

  listview = {
    background-color = color.background;
    padding = mkLiteral "0%";
    columns = 4;
    spacing = mkLiteral "0%";
    cycle = false;
    dynamic = false;
    layout = mkLiteral "vertical";
  };

  element = {
    background-color = color.background;
    text-color = color.foreground;
    border = mkLiteral "0% 0% 0.5% 0%";
    border-radius = 0;
    border-color = color.background;

    padding = mkLiteral "0% 0% 1% 0%";
    orientation = mkLiteral "vertical";
    margin = mkLiteral "0.5%";
  };

  "element selected" = {
    background-color = color.background;
    text-color = color.accent;
    border = mkLiteral "0% 0% 0.25% 0%";
    border-radius = 0;
    border-color = color.accent;
  };


  element-icon = {
    background-color = mkLiteral "inherit";
    text-color = mkLiteral "inherit";
    horizontal-align = mkLiteral "0.5";
    vertical-align = mkLiteral "0.5";
    size = mkLiteral "3%";
    border = mkLiteral "0px";
  };

  element-text = {
    background-color = color.background;
    text-color = mkLiteral "inherit";
    expand = true;
    horizontal-align = "0.5";
    vertical-align = mkLiteral "0.5";
    margin = mkLiteral "0.5% 0.5% -0.5% 0.5%";
  };
}

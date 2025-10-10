{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          # family = "LXGW WenKai Mono";
          family = "Maple Mono NF CN";
          style = "Regular";
        };
        bold = {
          # family = "LXGW WenKai Mono";
          family = "Maple Mono NF CN";
          style = "Bold";
        };
        italic = {
          # family = "LXGW WenKai Mono";
          family = "Maple Mono NF CN";
          style = "Italic";
        };
        bold_italic = {
          # family = "LXGW WenKai Mono";
          family = "Maple Mono NF CN";
          style = "Bold Italic";
        };
        size = 25.0;
      };
      window = {
        decorations = "none";
        # dynamic_padding = false;
        dynamic_title = true;
        opacity = 0.6;
        dimensions = {
          lines = 29;
          columns = 88;
        };
        padding = {
          # x = 255;
          # x = 30;
          y = 0;
        };
      };
      colors = {
        primary = {
          background = "#000000";
          foreground = "#ffe4e1";
        };
        cursor = {
          text = "#777777";
          cursor = "#89dceb";
        };
        normal = {
          black = "#4d4f66";
          red = "#ff5555";
          green = "#addb67";
          yellow = "#ffd866";
          blue = "#96cdfb";
          magenta = "#bd93f9";
          cyan = "#8be9fd";
          white = "#f8f8f2";
        };
        bright = {
          black = "#4d4f66";
          red = "#ff5555";
          green = "#addb67";
          yellow = "#ffd866";
          blue = "#96cdfb";
          magenta = "#bd93f9";
          cyan = "#8be9fd";
          white = "#f8f8f2";
        };
      };
    };
  };
}

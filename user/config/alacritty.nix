{ pkgs, lib, config, ... }:

with lib;
let
    cfg = config.modules.alacritty;
in {
    options.modules.alacritty = { enable = mkEnableOption "alacritty"; };

    config = mkIf cfg.enable {
        programs.alacritty = {
            enable = true;
            settings = {
                font = {
                    normal = {
                        family = "LXGW WenKai Mono";
                        style = "Regular";
                    };
                    bold = {
                        family = "LXGW WenKai Mono";
                        style = "Bold";
                    };
                    italic = {
                        family = "LXGW WenKai Mono";
                        style = "Italic";
                    };
                    bold_italic = {
                        family = "LXGW WenKai Mono";
                        style = "Bold Italic";
                    };
                    size = 23.0;
                };
                window = {
                    decorations = "none";
                    dynamic_padding = false;
                    opacity = 0.9;
                    dimensions = {
                        lines = 29;
                        columns = 88;
                    };
                    padding = {
                        x = 255;
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
    };
}

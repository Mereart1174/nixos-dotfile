{ pkgs, lib, config, fetchzip, inputs, ... }:

with lib;
let
    cfg = config.modules.waybar;
in {
    options.modules.waybar = { enable = mkEnableOption "waybar"; };

    config = mkIf cfg.enable {
        home.file.".config/waybar/style.css".text = import ../extraConfig/waybar.style;
        programs.waybar = {
            enable = true;
            settings = {
                mainBar = {
                    layer = "top";
                    modules-left = [
                        "custom/launcher"
                        "cpu"
                        "memory"
                        "tray"
                    ];
                    modules-center = [ "sway/workspaces" ];
                    modules-right = [
                        "backlight"
                        "pulseaudio"
                        "clock"
                        "battery"
                        "custom/power"
                    ];
                    "sway/workspaces" = {
                        disable-scroll = false;
                        all-outputs = true;
                        format = "{icon}";
                        persistent_workspaces = {
                            "1" = [];
                            "2" = [];
                            "3" = [];
                            "4" = [];
                            "5" = [];
                            "6" = [];
                            "7" = [];
                        };
                        format-icons = {
                            default = " ";
                            focused = " ";
                            urgent = " ";
                            "1" = "";
                            "2" = "";
                            "3" = "";
                            "4" = "";
                            "5" = "";
                            "6" = "";
                            "7" = "";
                        };
                        icon-size = 14;
                    };
                    "custom/power" = {
                        tooltip = false;
                        format = "襤";
                        on-click = "wlogout &";
                    };
                    "custom/launcher" = {
                        format = " ";
                        on-click = "rofi -show drun";
                        on-click-right = "killall rofi";
                    };
                    network = {
                        tooltip = false;
                        format-wifi = "  {essid}";
                    };
                    backlight = {
                        interval = 1;
                        tooltip = false;
                        format = " {}%";
                    };
                    battery = {
                        states = {
                            good = 95;
                            warning = 30;
                            critical = 20;
                        };
                        format = "{icon}    {capacity}%";
                        format-charging = "🕯️ ⚡ {capacity}%";
                        format-plugged = "  {capacity}%";
                        format-alt = "{time} {icon}";
                        format-icons = ["" "" "" "" ""];
                    };
                    tray = {
                        icon-size = 18;
                        spacing = 10;
                    };
                    clock = { format = "{:  %R    %m/%d}"; };
                    cpu = {
                        interval = 15;
                        format = "  {}%";
                        max-length = 10;
                    };
                    memory = {
                        interval = 30;
                        format = "  {}%";
                        max-length = 10;
                    };
                    pulseaudio = {
                        scroll-step = 5;
                        tooltip = false;
                        format = "{icon} {volume}%";
                        format-icons = { default = ["" "" ""]; };
                    };
                };
            };
        };
    };
}

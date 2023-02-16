{ lib, config, ... }:

let
    cfg = config.modules.waybar;
in {
    options.modules.waybar = { enable = lib.mkEnableOption "waybar"; };

    config = lib.mkIf cfg.enable {
        home.file.".config/waybar/style.css".source = ../extraConfig/waybar.style;
        programs.waybar = {
            enable = true;
            settings = {
                mainBar = {
                    layer = "top";
                    position = "top";
                    modules-left = [
                        "custom/launcher"
                        "custom/updates"
                        "cpu"
                        "memory"
                        "tray"
                    ];
                    modules-center = [ "wlr/workspaces" ];
                    modules-right = [
                        "network"
                        "backlight"
                        "pulseaudio"
                        "bluetooth"
                        "clock"
                        "battery"
                    ];
                    "custom/launcher" = {
                        format = " ";
                        on-click = "rofi -show drun";
                        on-click-right = "killall rofi";
                    };
                    "custom/updates" = {
                        exec = "(pacman -Qu) | wc -l";
                        interval = 3600;
                        format = "📥︎ {}";
                        on-click = "notify-send '更新结束'";
                    };
                    cpu = {
                        interval = 3;
                        format = "  {}%";
                        max-length = 10;
                    };
                    memory = {
                        interval = 3;
                        format = "  {}%";
                        max-length = 10;
                    };
                    tray = {
                        icon-size = 18;
                        spacing = 10;
                    };

                    "wlr/workspaces" = {
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
                            "8" = [];
                            "9" = [];
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
                            "8" = "";
                            "9" = "";
                        };
                        icon-size = 14;
                    };

                    network = {
                        interval = 3;
                        tooltip = false;
                        format-wifi = "⥣ {bandwidthUpBits} ⥥ {bandwidthDownBits}";
                        tooltip-format-wifi = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength:
                        {signalStrength}%\nFreq: {frequency}MHz";
                    };
                    backlight = {
                        format = " {}%";
                        on-scroll-up = "brightnessctl set +1%";
                        on-scroll-down = "brightnessctl set 1%-";
                    };
                    pulseaudio = {
                        on-click = "pamixer -t";
                        on-scroll-up =  "pamixer -i 1";
                        on-scroll-down =  "pamixer -d 1";
                        scroll-step = 1;
                        format = "{icon} {volume}%";
                        format-muted = "🔇";
                        format-icons = { default = ["" "" ""]; };
                    };
                    clock = { format = "{:  %R    %m/%d}"; };
                    bluetooth = {
                        format = " {status}";
                        format-connected = " ";
                        on-click = "blueberry";
                    };
                    battery = {
                        states = {
                            good = 80;
                            warning = 30;
                            critical = 20;
                        };
                        format = "{icon}    {capacity}%";
                        format-charging = "🕯️ {capacity}%";
                        format-plugged = "🕯️ {capacity}%";
                        format-alt = "{time} {icon}";
                        format-icons = ["" "" "" "" ""];
                    };
                    "custom/power" = {
                        tooltip = false;
                        format = " ";
                        on-click = "wlogout &";
                    };
                };
            };
        };
    };
}

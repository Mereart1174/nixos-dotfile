{ lib, config, ... }:

let
    cfg = config.modules.rofi;
in {
    options.modules.rofi = { enable = lib.mkEnableOption "rofi"; };

    config = lib.mkIf cfg.enable {
        programs.rofi = {
            enable = true;
            font = "LXGW WenKai Mono 14";
            extraConfig = {
                modi = "drun,filebrowser";
                line = 6;
                show-icons = true;
                terminal = "Alacritty";
                drun-dispaly-format = "{icon} {name}";
                location = 0;
                disable-history = false;
                hide-scrollbar = true;
                display-drun = "   Apps ";
                display-run = "   Run ";
                display-window = " 﩯  window";
                display-Network = " 󰤨  Network";
                sidebar-mode = true;
            };
        };
    };
}

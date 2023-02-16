{ lib, config, ... }:

let
    cfg = config.modules.hyprland;
in {
    options.modules.hyprland = { enable = lib.mkEnableOption "hyprland"; };

    config = lib.mkIf cfg.enable {
        home.file.".config/hypr/hyprland.conf".source = ../extraConfig/hyprland.conf;
    };
    # wayland.windowManager.hyprland.extraConfig = ''
}

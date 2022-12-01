{ inputs, pkgs, lib, config, ... }:

with lib;
let
    cfg = config.modules.hyprland;
    # mkService = lib.recursiveUpdate {
    #     Unit.PartOf = [ "graphical-session.target" ];
    #     Unit.After = [ "graphical-session.target" ];
    #     Install.WantedBy = [ "graphical-session.target" ];
    # };
in {
    options.modules.hyprland = { enable = mkEnableOption "hyprland"; };

    config = mkIf cfg.enable {
        home.file.".config/hypr/hyprland.conf".text = import ../extraConfig/hyprland.conf;
        # home.pointerCursor.gtk.enable = true;
        # home.pointerCursor = {
        #     package = pkgs.catppuccin-cursors;
        #     name = "Catppuccin-Frappe-Dark";
        #     size = 48;
        # };

        # services.gammastep = {
        #     enable = true;
        #     provider = "geoclue2";
        # };

        # systemd.user.services = {
        #     swaybg = mkService {
        #         Unit.Description = "Wallpaper chooser";
        #         Service.ExecStart = "${pkgs.swaybg}/bin/swaybg -i ${../wallpaper/door.png}";
        #     };
        # };
    };
}

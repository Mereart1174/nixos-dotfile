{ config, lib, pkgs, ... }:

let
    cfg = config.modules.gtk;
in {
    options.modules.gtk = { enable = lib.mkEnableOption "gtk"; };

    config = lib.mkIf cfg.enable {
        gtk = {
            enable = true;
            theme = {
                name = "Catppuccin-Macchiato-Standard-Dark";
                package = pkgs.catppuccin-gtk.override {
                    accents = [ "mauve" ];
                    variant = "macchiato";
                };
            };
            # iconTheme = {
            #     package = pkgs.catppuccin-folders;
            #     name = "Papirus";
            # };
            font = {
                name = "LXGW Wenkai";
                size = 13;
            };
            gtk3.extraConfig = {
                gtk-xft-antialias = 1;
                gtk-xft-hinting = 1;
                gtk-xft-hintstyle = "hintslight";
                gtk-xft-rgba = "rgb";
            };
            gtk2.extraConfig = ''
                gtk-xft-antialias = 1
                gtk-xft-hinting = 1
                gtk-xft-hintstyle = "hintslight"
                gtk-xft-rgba = "rgb"
            '';
            };
    };
}

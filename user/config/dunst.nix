{ lib, config, ... }:

let
    cfg = config.modules.dunst;
in {
    options.modules.dunst = { enable = lib.mkEnableOption "dunst"; };

    config = lib.mkIf cfg.enable {
        home.file.".config/dunst/dunstrc".source = ../extraConfig/dunstrc;
    };
}

{ config, lib, ... }:

let
    cfg = config.modules.fcitx;
in {
    options.modules.fcitx = { enable = lib.mkEnableOption "fcitx"; };

    config = lib.mkIf cfg.enable {
    };
}

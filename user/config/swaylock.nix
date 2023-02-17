{ config, lib, ... }:

let
    cfg = config.modules.swaylock;
in {
    options.modules.swaylock = { enable = lib.mkEnableOption "swaylock"; };

    config = lib.mkIf cfg.enable {
        home.file.".config/swaylock/config".source = ../extraConfig/swaylock.conf;
    };
}

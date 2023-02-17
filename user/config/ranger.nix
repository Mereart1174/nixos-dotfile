{ config, lib, ... }:

let
    cfg = config.modules.ranger;
in {
    options.modules.ranger = { enable = lib.mkEnableOption "ranger"; };

    config = lib.mkIf cfg.enable {
        home.file.".config/ranger/rc.conf".source = ../extraConfig/rc.conf;
    };
}

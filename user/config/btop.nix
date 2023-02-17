{ config, lib, ... }:

let
    cfg = config.modules.btop;
in {
    options.modules.btop = { enable = lib.mkEnableOption "btop"; };

    config = lib.mkIf cfg.enable {
        home.file.".config/btop/btop.conf".source = ../extraConfig/btop.conf;
    };
}

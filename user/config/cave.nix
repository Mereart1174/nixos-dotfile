{ lib, config, ... }:

let
    cfg = config.modules.cave;
in {
    options.modules.cave = { enable = lib.mkEnableOption "cave"; };

    config = lib.mkIf cfg.enable {
        home.file.".config/cava/cava.conf".source = ../extraConfig/cava.conf;
    };
}

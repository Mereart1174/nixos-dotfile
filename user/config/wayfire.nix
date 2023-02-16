{ lib, config, ... }:

let
    cfg = config.modules.wayfire;
in {
    options.modules.wayfire = { enable = lib.mkEnableOption "wayfire"; };

    config = lib.mkIf cfg.enable {
        home.file.".config/wayfire.ini".source = ../extraConfig/wayfire.ini;
    };
}

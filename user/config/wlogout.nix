{ pkgs, lib, config, ... }:

with lib;
let
    cfg = config.modules.wlogout;
in {
    options.modules.wlogout = { enable = mkEnableOption "wlogout"; };

    config = mkIf cfg.enable {
        home.file.".config/wlogout/style.css".text = import ../extraConfig/wlogout.style;
        home.file.".config/wlogout/layout".text = import ../extraConfig/wlogout.layout;
    };
}

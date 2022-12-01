{ pkgs, lib, config, ... }:

with lib;
let
    cfg = config.modules.neofetch;
in {
    options.modules.neofetch = { enable = mkEnableOption "neofetch"; };

    config = mkIf cfg.enable {
        home.file.".config/neofetch/config.conf".text = import ../extraConfig/neofetch.style;
   };
}

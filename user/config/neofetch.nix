{ config, lib, ... }:

let
    cfg = config.modules.neofetch;
in {
    options.modules.neofetch = { enable = lib.mkEnableOption "neofetch"; };

    config = lib.mkIf cfg.enable {
        home.file.".config/neofetch/config.conf".source =  ../extraConfig/neofetch.conf;
   };
}

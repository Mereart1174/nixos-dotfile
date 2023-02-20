{ config, lib, ... }:

let
    cfg = config.modules.git;
in {
    options.modules.git = { enable = lib.mkEnableOption "git"; };

    config = lib.mkIf cfg.enable {
        programs.git = {
            enable = true;
            userName = "Mereart1174";
            userEmail = "mereart1174@163.com";
            extraConfig = {
                init = { defaultBranch = "main"; };
                delta = {
                    line-numbers = true;
                };
            };
        };
    };
}

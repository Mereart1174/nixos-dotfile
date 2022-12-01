{ pkgs, lib, config, ... }:

with lib;
let
    cfg = config.modules.git;
in {
    options.modules.git = { enable = mkEnableOption "git"; };

    config = mkIf cfg.enable {
        programs.git = {
            enable = true;
            userName = "Mereart";
            userEmail = "mereart1174@163.com";
            extraConfig = {
                init = { defaultBranch = "main"; };
                delta = {
                    syntax-theme = "Nord";
                    line-numbers = true;
                };
            };
        };
    };
}

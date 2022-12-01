{ pkgs, lib, config, ... }:

with lib;
let
    cfg = config.modules.starship;
in {
    options.modules.starship = { enable = mkEnableOption "starship"; };

    config = mkIf cfg.enable {
        programs.starship = {
            enable = true;
            settings = {
                add_newline = false;
                username.disabled = false;
                format = lib.concatStrings [
                    "[╭─ ](bold black)[  ](#ffd866)"
                    "$all"
                    "$fill"
                    "$time[ ♍](#bd93f9)$python"
                    "$line_break"
                    "$shell[╰─](bold black)"
                    "$character"
                ];
                scan_timeout = 10;
                character = {
                    success_symbol = "[ഒ ](bold green)";
                    error_symbol = "[ഒ ](bold red)";
                    vicmd_symbol = "[ഒ ](bold yellow)";
                };
                golang.symbol = " ";
                rust.symbol = "[ ]";
                lua.symbol = "[ ]";
                python.symbol = "[ ]";
                nodejs.symbol = "[ ]";
                package.symbol = "[ ]";
                java.symbol = "[ ]";
                cmd_duration = { style = "yellow"; };
                directory = { truncation_length = 3; };
                git_branch = { symbol = " "; };
                time = {
                    disabled = false;
                    format = "[](#282a36)[ $time ](bg:#282a36 fg:#ffd866)";
                    time_format = " %H:%M";
                };
            };
        };
    };
}

{ lib, config, ... }:

let
    cfg = config.modules.zsh;
in {
    options.modules.zsh = { enable = lib.mkEnableOption "zsh"; };

    config = lib.mkIf cfg.enable {
        programs.zsh = {
            enable = true;
            enableCompletion = true;
            enableAutosuggestions = true;
            enableSyntaxHighlighting = true;
            completionInit = ''
                autoload -Uz compinit && compinit -u
                zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
            '';
            sessionVariables = {
                EDITOR="nvim --noplugin";
                PAGER="less";
                TERMINAL = "alacritty";
                BROWSER = "firefox";
                BAT_THEME = "Dracula";
                MANPAGER = "sh -c 'col -bx | bat -l man -p'";
                MANROFFOPT = "-c";
                NIX_CONFIG_DIR = "/home/phil/.config/nixos";
            NIXOS_CONFIG = "$HOME/.config/nixos/system/nixosConfig.nix";
            };
            initExtra = ''
                eval "$(starship init zsh)"
                eval "$(zoxide init zsh)"
                eval "$(direnv hook zsh)"

                setopt hist_save_no_dups
                setopt hist_ignore_dups
                setopt hist_ignore_space

                ex ()
                {
                    if [ -f $1 ] ; then
                        case $1 in
                            *.tar.bz2)     tar xjf $1     ;;
                            *.tar.gz)      tar xzf $1     ;;
                            *.rar)         unrar x $1     ;;
                            *.tar)         tar xf $1      ;;
                            *.tbz2)        tar xjf $1     ;;
                            *.tgz)         tar xzf $1     ;;
                            *.zip)         unzip -O GBK $1       ;;
                            *.7z)          7z x $1        ;;
                            *.tar.xz)      tar xf $1      ;;
                            *.tar.zst)     tar xf $1      ;;
                            *)             echo "'$1'   cannot be extracted via ex()"   ;;
                        esac
                    else
                        echo "'$1' is not a valid file"
                    fi
                }
            '';
            history = {
                save = 10000;
                size = 10000;
                path = "$HOME/.config/zsh/zsh_history";
                expireDuplicatesFirst = true;
                ignoreDups = true;
                ignoreSpace = true;
            };
            shellAliases = {
                # Common
                sudo = "doas";
                suod = "doas";
                n = "nvim";
                r = "ranger";
                s = "source";
                k = "kill -9";
                m = "mkdir -p";
                qe = "exit";
                nn = "nvim --clean";
                rm = "rm -iv";
                du = "dust";
                hm = "home-manager";
                cat = "bat --show-all --plain";
                grep = "rg";
                find = "fd";
                ls = "exa --icons --group-directories-first --tree --level=1";
                ll = "exa --icons --group-directories-first --tree --level=1 -lh";
                la = "exa --icons --group-directories-first --sort=size --tree --level=1 -lah";
                lss = "exa --icons --group-directories-first --tree --level=3";
                lsss = "exa --icons --group-directories-first --tree";
                hg = "history 1 | grep";

                # sz = "home-manager switch --flake $NIX_CONFIG_DIR";
                sz = "doas nixos-rebuild switch --flake $NIX_CONFIG_DIR#magicbook";
                nz = "nvim $NIX_CONFIG_DIR/user/config/zsh.nix";
                np = "nvim $NIX_CONFIG_DIR/user/Philomatics.nix";
                nh = "nvim $NIX_CONFIG_DIR/user/extraConfig/hyprland.conf";
                nl = "neofetch";
                cn = "cd $NIX_CONFIG_DIR";
                nf = "nvim $NIX_CONFIG_DIR/flake.nix";
                tq = "curl wttr.in";
                fy = "trans :zh-CN";
                pi = "curl cip.cc";

                fq = "export http_proxy=127.0.0.1:7890; export https_proxy=127.0.0.1:7890";
                spnn = "nix search nixpkgs";
                sc = "sudo systemctl";
                ce = "nvim ~/Mygits/Learning/CE/common.md";
            };
        };
    };
}

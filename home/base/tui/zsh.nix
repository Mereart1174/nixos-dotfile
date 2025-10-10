{ config, lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    completionInit = ''
      autoload -Uz compinit && compinit -u
      # 仅在输入全小写时忽略大小写（输入大写时严格匹配）
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
      # 补全忽略大小写，无论输入的大写还是小写
      # zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    '';
    sessionVariables = {
      EDITOR = "nvim --noplugin";
      PAGER = "less";
      TERMINAL = "alacritty";
      BAT_THEME = "Dracula";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MANROFFOPT = "-c";
    };
    history = {
      save = 10000;
      size = 10000;
      # path = "$HOME/.config/zsh/zsh_history";
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
    };
    shellAliases = {
      # Common
      # sudo = "doas";
      # suod = "doas";
      n = "nvim";
      r = "yazi";
      s = "source";
      k = "kill -9";
      m = "mkdir -p";
      qe = "exit";
      nn = "nvim --clean";
      rm = "rm -iv";
      du = "dust";
      hm = "home-manager";
      cat = "bat --plain";
      grep = "rg";
      find = "fd";
      ls = "eza --icons --group-directories-first --tree --level=1";
      ll = "eza --icons --group-directories-first --tree --level=1 -lh";
      la = "eza --icons --group-directories-first --sort=size --tree --level=1 -lah";
      lss = "eza --icons --group-directories-first --tree --level=3";
      lsss = "eza --icons --group-directories-first --tree";
      hg = "history 1 | grep";
  
      # syu = "home-manager switch --flake $NIX_CONFIG_DIR";
      syu = "doas nixos-rebuild switch --flake $NIX_CONFIG_DIR#nixos";
      sz = "source ~/.zshrc";
      nz = "nvim $NIX_CONFIG_DIR/user/config/zsh.nix";
      na = "nvim $NIX_CONFIG_DIR/user/config/alacritty.nix";
      nw = "nvim $NIX_CONFIG_DIR/user/extraConfig/wayfire.ini";
      np = "nvim $NIX_CONFIG_DIR/user/config/default.nix";
      # nh = "nvim $NIX_CONFIG_DIR/user/extraConfig/hyprland.conf";
      nl = "neofetch";
      fq = "export http_proxy=127.0.0.1:7890; export https_proxy=127.0.0.1:7890";
      spnn = "doas nix search nixpkgs";
      spq = "ls /nix/store | rg";
      sc = "sudo systemctl";
      ce = "nvim ~/Mygits/Learning/CE/common.md";
    };
  };
}

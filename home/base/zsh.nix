{ config, lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    initContent = ''
      cp2win() {
        if [ -z "$1" ]; then
          echo "错误: 请输入文件名。用法: wsl2win <filename>"
          return 1
        fi

        if [ -f "$1" ]; then
          cat "$1" | iconv -f utf-8 -t gb2312 | clip.exe
          echo "已成功复制 '$1' 的内容到 Windows 剪贴板。"
        else
          echo "错误: 文件 '$1' 不存在。"
          return 1
        fi
      }
    '';
    completionInit = ''
      bindkey -e
      autoload -Uz compinit && compinit -u
      # 仅在输入全小写时忽略大小写（输入大写时严格匹配）
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
      # 补全忽略大小写，无论输入的大写还是小写
      # zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    '';
    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "less";
      TERMINAL = "alacritty";
      BAT_THEME = "Dracula";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MANROFFOPT = "-c";
    };
    history = {
      save = 10000;
      size = 10000;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
    };
    shellAliases = {
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
  
      syun = "sudo nixos-rebuild switch --flake /home/philo/nixos-dotfile#magicbook-niri";
      syunt = "sudo nixos-rebuild test --flake /home/philo/nixos-dotfile#magicbook-niri";
      syu = "sudo nixos-rebuild switch --flake /home/philo/nixos-dotfile#wsl-nixos";
      syut = "sudo nixos-rebuild test --flake /home/philo/nixos-dotfile#wsl-nixos";
      nz = "nvim /home/philo/nixos-dotfile/home/base/zsh.nix";
      ndev = "nvim /home/philo/nixos-dotfile/home/base/pkgs-dev.nix";
      cdnix = "cd /home/philo/nixos-dotfile/";
      cdstm = "cd /home/philo/PL/Rust/stm32/";

      sz = "source ~/.config/zsh/.zshrc";
      nf = "nvim flake.nix";
      nm = "nvim src/main";
      nl = "fastfetch";
      spss = "sudo nix search nixpkgs";
      spq = "ls /nix/store | rg";
      sc = "systemctl status";
      acpi = "cat /sys/class/power_supply/BAT1/capacity /sys/class/power_supply/BAT1/status";
    };
  };
}

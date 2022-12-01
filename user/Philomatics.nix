{ inputs, pkgs, lib, config, ... }:

{
    home.username = "mere";
    home.homeDirectory = "/home/mere";

    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "22.11";

    programs.home-manager.enable = true;

    imports = [ ./config/default.nix ];

    home.packages = with pkgs; [
        # unfree pkgs
            # unrar
        # systemctl pkgs
            # easyeffects unzip git minizip
        # unconfig pkgs
            # neovim

        # Command Line
            # alacritty
        kitty
        hyfetch
        exa ripgrep bat fd btop du-dust bottom
        zsh neofetch starship ranger
            # doas openssh

        # Development Tools
            # rustup llvm qemu_full

        # Desktop Application
        hyprland waybar
        swaylock wlogout
        rofi mako mpv imv swaybg mpvpaper
        wl-clipboard wlsunset
            # firefox
            # brightnessctl
            # wayfire wf-config wlroots
            # vulkan-tools
            # virt-manager
    ];
}

{ config, lib, pkgs, ... }:

let
    folder = ./.;
    toImport = name: value: folder + ("/" + name);
    filterConfig = key: value: value == "regular" && lib.hasSuffix ".nix" key && key != "default.nix";
    imports = lib.mapAttrsToList toImport (lib.filterAttrs filterConfig (builtins.readDir folder));
in {
    home.stateVersion = "22.11";

    home = {
        username = "phil";
        homeDirectory = "/home/phil";
    };

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        # Command Line Tools
        neovim
        ranger neofetch starship
        exa ripgrep bat fd zoxide
        du-dust bottom btop ranger
        git doas curl wget clash
	home-manager

        # Development Tools
	direnv pacman
            # rustup llvm qemu_full
            # python3

        # Desktop Application
        alacritty
        easyeffects
        firefox-wayland
        mpv mpvpaper imv
        rofi dunst
        swaylock-effects wlogout
        wl-clipboard wlsunset
        brightnessctl pamixer
        hyprland wayfire
        waybar cava # swww
	dconf
            # virt-manager
    ];

    inherit imports;
}

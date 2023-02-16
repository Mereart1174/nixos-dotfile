{ config, input, ... }:

{
    imports = [
        ./config/default.nix
        input.hyprland.homeManagerModules.default
    ];

    config.modules = {
        alacritty.enable = true;
        btop.enable = true;
        cave.enable = true;
        dunst.enable = true;
        # firefox.enable = true;
        git.enable = true;
        gtk.enable = true;
        hyprland.enable = true;
        neofetch.enable = true;
        ranger.enable = true;
        rofi.enable = true;
        starship.enable = true;
        swaylock.enable = true;
        waybar.enable = true;
        wayfire.enable = true;
        zoxide.enable = true;
        zsh.enable = true;
    };
}

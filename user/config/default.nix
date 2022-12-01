{ lib, config, ... }:

let
    folder = ./.;
    toImport = name: value: folder + ("/" + name);
    filterConfig = key: value: value == "regular" && lib.hasSuffix ".nix" key && key != "default.nix";
    imports = lib.mapAttrsToList toImport (lib.filterAttrs filterConfig (builtins.readDir folder));
in {
    inherit imports;

    config.modules = {
        zsh.enable = true;
        starship.enable = true;
        # git.enable = true;
        neofetch.enable = true;
        # wlogout.enable = true;
        # wayland.windowManager.hyprland.enable = true;
        waybar.enable = true;
    };
}

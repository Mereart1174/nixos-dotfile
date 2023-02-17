{ config, lib, pkgs, ... }:

{
    time.timeZone = "Asia/Shanghai";

    i18n = {
        defaultLocale = "en_US.UTF-8";
        supportedLocales = [
            "zh_CN.UTF-8/UTF-8"
            "en_US.UTF-8/UTF-8"
        ];
        inputMethod = {
                enabled = "fcitx5";
                fcitx5.addons = with pkgs; [ fcitx5-rime ];
        };
    };

    fonts = {
        fonts = with pkgs; [
            lxgw-wenkai
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            jetbrains-mono
            inconsolata-nerdfont
            (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
        ];
        fontconfig = {
            defaultFonts = lib.mkForce {
                serif = [ "Noto Serif" "Noto Color Emoji" ];
                sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
                monospace = [ "LXGW WenKai" ];
                # emoji = [ "Noto Color Emoji" ];
            };
        };
    };
}

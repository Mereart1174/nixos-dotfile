{ config, pkgs, ... }:

{
    users = {
        mutableUsers = false;
        users.phil = {
            isNormalUser = true;
            extraGroups = [
                "wheel"
                "audio"
                "video"
                "networkmanager"
            ];
            password = "123";
            shell = pkgs.zsh;
        };
    };
}

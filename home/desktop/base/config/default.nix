{ config, ... }:
{
  xdg.configFile =
    let
      mkSymlink = config.lib.file.mkOutOfStoreSymlink;
      confPath = "${config.home.homeDirectory}/nixos-dotfile/home/desktop/base/config";
    in
    {
      # "mako".source = mkSymlink "${confPath}/mako";
      "waybar".source = mkSymlink "${confPath}/waybar";
      "wlogout".source = mkSymlink "${confPath}/wlogout";
      "hypr/hypridle.conf".source = mkSymlink "${confPath}/hypridle.conf";
    };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  # programs.swaylock.enable = true;

  programs.wlogout.enable = true;

  # services.hypridle.enable = true;

  services.mako.enable = true;
}

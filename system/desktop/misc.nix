{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  # add user's shell into /etc/shells
  environment.shells = with pkgs; [
    bashInteractive
    zsh
  ];
  # set user's default shell system-wide
  users.defaultUserShell = pkgs.zsh;

  # fix for `sudo xxx` in kitty/wezterm/foot and other modern terminal emulators
  security.sudo.keepTerminfo = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gnumake
    wl-clipboard
    # rustdesk-flutter
  ];


  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    # resolved.enable = true;
    #rustdesk-server = {
    #  enable = true;
    #  openFirewall = true;
    #};
    mihomo = {
      enable = true;
      tunMode = false;
      configFile = "/home/philo/dog-clash.yaml";
      # configFile = "/etc/mihomo/mihomo.yaml";
    };
    dae = {
      enable = true;
      configFile = "/home/philo/clash-config.dae";
      # configFile = "/etc/dae/config.dae";
      assets = with pkgs; [
        v2ray-geoip
        v2ray-domain-list-community
      ];
    };
  };

  programs.dconf.enable = true;

  environment.sessionVariables = {
    INPUT_METHOD = "fcitx";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
  };

  # 确保 xdg autostart 在 Wayland 下生效
  services.xserver.desktopManager.runXdgAutostartIfNone = true;
}

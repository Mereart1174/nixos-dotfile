{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  boot.loader.timeout = lib.mkForce 10; # wait for x seconds to select the boot entry

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
      # configFile = config.age.secrets.mihomo.path;
      configFile = "/home/philo/dog-clash.yaml";
    };
    dae = {
      enable = true;
      # configFile = config.age.secrets.dae.path;
      configFile = "/home/philo/clash-config.dae";
      assets = with pkgs; [
        v2ray-geoip
        v2ray-domain-list-community
      ];
    };
  };

  programs = {
    # dconf is a low-level configuration system.
    dconf.enable = true;
  };
}

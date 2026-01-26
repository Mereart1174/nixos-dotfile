{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    swaybg
    wl-clipboard
    hyprpicker
    brightnessctl
    hyprshot
    wf-recorder
    alsa-utils
    networkmanagerapplet
  ];

  programs = {
    google-chrome = {
      enable = true;
      package = if pkgs.stdenv.isAarch64 then pkgs.chromium else pkgs.google-chrome;

      # https://wiki.archlinux.org/title/Chromium#Native_Wayland_support
      commandLineArgs = [
        "--ozone-platform-hint=auto"
        "--ozone-platform=wayland"
        # make it use GTK_IM_MODULE if it runs with Gtk4, so fcitx5 can work with it.
        # (only supported by chromium/chrome at this time, not electron)
        "--gtk-version=4"
        # make it use text-input-v1, which works for kwin 5.27 and weston
        "--enable-wayland-ime"

        # enable hardware acceleration - vulkan api
        # "--enable-features=Vulkan"
      ];
    };
  };

  # wayland related
  home.sessionVariables = {
    "NIXOS_OZONE_WL" = "1"; # for any ozone-based browser & electron apps to run on wayland
    "MOZ_ENABLE_WAYLAND" = "1"; # for firefox to run on wayland
    "MOZ_WEBRENDER" = "1";
    # enable native Wayland support for most Electron apps
    "ELECTRON_OZONE_PLATFORM_HINT" = "auto";
    # misc
    "_JAVA_AWT_WM_NONREPARENTING" = "1";
    "QT_WAYLAND_DISABLE_WINDOWDECORATION" = "1";
    "QT_QPA_PLATFORM" = "wayland";
    "SDL_VIDEODRIVER" = "wayland";
    "GDK_BACKEND" = "wayland";
    "XDG_SESSION_TYPE" = "wayland";
  };

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

  # status bar
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  # screen locker
  # programs.swaylock.enable = true;

  # Logout Menu
  programs.wlogout.enable = true;

  # Hyprland idle daemon
  # services.hypridle.enable = true;
  
  # notification daemon, the same as dunst
  services.mako.enable = true;
}

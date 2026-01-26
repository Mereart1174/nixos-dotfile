{
  pkgs,
  pkgs-x64,
  pkgs-unstable,
  ...
}:
# media - control and enjoy audio/video
{
  home.packages = with pkgs; [
    ffmpeg-full
    # audio control
    pavucontrol
    playerctl
    pulsemixer
    # image
    imv
    imagemagick
    graphviz
  ];

  programs.mpv = {
    enable = true;
    defaultProfiles = [ "gpu-hq" ];
    scripts = [ pkgs.mpvScripts.mpris ];
  };

  services = {
    playerctld.enable = true;
  };
}

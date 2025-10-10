{
  # replacement of htop/nmon
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "ayu";
      theme_background = false; # make btop transparent
    };
  };
}

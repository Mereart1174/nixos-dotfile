{ config, pkgs, ... }:
{
  xdg.configFile = {
    "fcitx5/rime" = {
      source = pkgs.fetchFromGitHub {
        owner = "iDvel";
        repo = "rime-ice";

        rev = "main";

        sha256 = "u4KYZaaXDayPHa+TuMKoYoVEmOJm1egonAje+NF65aM=";
      };
      recursive = true;
    };
  };

  # i18n.inputMethod = {
  #   enable = true;
  #   type = "fcitx5";
  #   fcitx5.waylandFrontend = true;
  #   fcitx5.addons = with pkgs; [
  #     qt6Packages.fcitx5-configtool # GUI for fcitx5
  #     fcitx5-gtk # gtk im module
  #
  #     # Chinese
  #     fcitx5-rime # for flypy chinese input method
  #   ];
  # };
}

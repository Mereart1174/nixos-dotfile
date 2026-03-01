{ config, pkgs, lib, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      qt6Packages.fcitx5-configtool
      fcitx5-gtk
      fcitx5-fluent

      (fcitx5-rime.override {
        rimeDataPkgs = [
          pkgs.rime-ice
        ];
      })
    ];
  };

  home.file.".local/share/fcitx5/rime/default.custom.yaml".text = ''
    patch:
      __include: rime_ice_suggestion:/
      __patch:
        # 横排显示
        "style/horizontal": true
        # 候选词数量
        "menu/page_size": 7
      schema_list:
        - schema: rime_ice
  '';
}

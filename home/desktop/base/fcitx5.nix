{ config, pkgs, lib, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      # qt6Packages.fcitx5-configtool
      fcitx5-gtk
      # fcitx5-fluent

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
      "style/color_scheme": "aalost_temple"
  '';

  home.file.".local/share/fcitx5/rime/weasel.custom.yaml".text = ''
    preset_color_schemes:
      aalost_temple:
        author: "<chen.sst@gmail.com>, based on ir_black"
        back_color: 0x444444
        border_color: 0x444444
        hilited_back_color: 0x222222
        hilited_candidate_back_color: 0x82e6ca
        hilited_candidate_text_color: 0x000000
        hilited_text_color: 0x82e6ca
        name: "孤寺／Lost Temple"
        text_color: 0xe8f3f6
    '';
  home.file.".config/fcitx5/conf/classicui.conf".text = ''
    Vertical Candidate List=False
    WheelForPaging=True
    Font="Maple Mono NF CN 18"
    MenuFont="Maple Mono NF CN 18"
    TrayFont="Maple Mono NF CN 18"
    TrayOutlineColor=#000000
    TrayTextColor=#ffffff
    PreferTextIcon=False
    ShowLayoutNameInIcon=True
    UseInputMethodLanguageToDisplayText=True
    Theme=default-dark
    DarkTheme=default-dark
    UseDarkTheme=False
    UseAccentColor=True
    PerScreenDPI=False
    ForceWaylandDPI=0
    EnableFractionalScale=True
  '';
}

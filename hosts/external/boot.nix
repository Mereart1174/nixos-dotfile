{ lib, pkgs, mylib, ... }:
{
  boot.loader = {
    grub= {
      enable = true;
      device = "nodev";
      efiSupport = true;
      theme = mylib.relativeToRoot "home/nixos/gui/base/desktop/config/CyberEXS";
    };
  };
}

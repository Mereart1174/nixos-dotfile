{ lib, pkgs, mylib, ... }:
{
  environment.systemPackages = with pkgs; [ os-prober ];
  boot.loader = {
    grub= {
      enable = true;
      device = "nodev";
      # device = "/dev/sda";
      efiSupport = true;
      useOSProber = true;
      theme = mylib.relativeToRoot "home/desktop/base/desktop/config/CyberEXS";
    };
  };
}

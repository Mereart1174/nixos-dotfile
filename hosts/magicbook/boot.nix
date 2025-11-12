# { lib, ... }:
{ lib, pkgs, mylib, ... }:
{
  # boot.loader.systemd-boot = {
    # we use Git for version control, so we don't need to keep too many generations.
   #  configurationLimit = lib.mkDefault 10;
    # pick the highest resolution for systemd-boot's console.
   #  consoleMode = lib.mkDefault "max";
  # };
  environment.systemPackages = with pkgs; [ os-prober ];
  boot.loader = {
    grub= {
      enable = true;
      device = "nodev";
      # device = "/dev/sda";
      efiSupport = true; # uefi
      useOSProber = true;
      theme = mylib.relativeToRoot "home/nixos/gui/base/desktop/config/CyberEXS";
    };
  };
}

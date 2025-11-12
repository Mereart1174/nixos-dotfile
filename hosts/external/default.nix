{ myvars, lib, ... }:
#############################################################
#
#  Magicbook Pro 2019 - my first computer, with Arch + NixOS + Win11 + Deepined.
#
#############################################################
let
  hostName = "external";
in
{
  imports = [
    # ./netdev-mount.nix
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./gpu.nix
    ./boot.nix

    ./preservation.nix
    # ./secureboot.nix
  ];

  # services.sunshine.enable = lib.mkForce true;

  networking = {
    inherit hostName;
    networkmanager.enable = true;
    # useDHCP = false;
    # firewall.enable = false;
  };

  # networking.useNetworkd = true;
  # systemd.network.enable = true;


  system.stateVersion = "25.05";
}

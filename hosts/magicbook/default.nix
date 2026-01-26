{ myvars, lib, ... }:
let
  hostName = "magicbook";

in
{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./boot.nix

    ./preservation.nix
  ];

  # services.sunshine.enable = lib.mkForce true;

  networking = {
    inherit hostName;
    networkmanager.enable = true;
    # useDHCP = false;
    # firewall.enable = false;
  };

  system.stateVersion = "25.05";
}

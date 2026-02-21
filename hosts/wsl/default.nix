{ myvars, lib, ... }:
let
  hostName = "wsl";
in
{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
  ];

  # services.sunshine.enable = lib.mkForce true;

  networking = {
    inherit hostName;
    networkmanager.enable = true;
    # useDHCP = false;
    # firewall.enable = false;
  };

  system.stateVersion = "25.11";
}

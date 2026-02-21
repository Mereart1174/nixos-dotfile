{ myvars, lib, ... }:
let
  hostName = "wsl";
in
{
  imports = [
    ./nvidia.nix
    ./wsl.nix
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

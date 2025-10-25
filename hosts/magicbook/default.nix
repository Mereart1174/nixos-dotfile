{ myvars, lib, ... }:
#############################################################
#
#  Ai - my main computer, with NixOS + I5-13600KF + RTX 4090 GPU, for gaming & daily use.
#
#############################################################
let
  hostName = "magicbook"; # Define your hostname.

in
{
  imports = [
    # ./netdev-mount.nix
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./nvidia.nix
    # ./ai

    ./preservation.nix
    # ./secureboot.nix
  ];

  # services.sunshine.enable = lib.mkForce true;

  networking = {
    inherit hostName;

    # we use networkd instead
    networkmanager.enable = true; # provides nmcli/nmtui for wifi adjustment
    # useDHCP = false;
    # firewall.enable = false;
  };

  # networking.useNetworkd = true;
  # systemd.network.enable = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}

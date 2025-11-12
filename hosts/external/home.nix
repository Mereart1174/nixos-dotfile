{ config, niri, ... }:
{
  # programs.ssh.matchBlocks."github.com".identityFile = "${config.home.homeDirectory}/.ssh/idols-ai";

  modules.desktop.nvidia.enable = true;

  # modules.desktop.hyprland.settings.source = [
  #   "${config.home.homeDirectory}/nix-config/hosts/idols-ai/hypr-hardware.conf"
  # ];

}

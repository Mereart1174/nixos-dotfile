{
  lib,
  pkgs,
  config,
  agenix,
  myvars,
  ...
}:
with lib;
let
  cfg = config.modules.secrets;

  noaccess = {
    mode = "0000";
    owner = "root";
  };
  high_security = {
    mode = "0500";
    owner = "root";
  };
  user_readable = {
    mode = "0500";
    owner = myvars.username;
  };
in
{
  imports = [
    agenix.nixosModules.default
  ];

  options.modules.secrets = {
    desktop.enable = mkEnableOption "NixOS Secrets for Desktops";
  };

  config = mkIf cfg.desktop.enable {
    environment.systemPackages = with pkgs; [
      agenix.packages.x86_64-linux.default
      age
    ];

    age.identityPaths = [
      "/etc/ssh/ssh_host_ed25519_key"
    ];

    age.secrets = {
      "mihomo.yaml" = {
        file = ../docs/mihomo/mihomo.yaml.age;
      }
      // high_security;
      "config.dae" = {
        file = ../docs/dae/config.dae.age;
      }
      // high_security;
    };

    environment.etc = {
      "mihomo/mihomo.yaml" = {
        source = config.age.secrets."mihomo.yaml".path;
      };
      "dae/config.dae" = {
        source = config.age.secrets."config.dae".path;
      };
    };
  };
}

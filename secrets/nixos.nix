{
  lib,
  pkgs,
  agenix,
  myvars,
  ...
}:
{
  imports = [ agenix.nixosModules.default ];
  environment.systemPackages = with pkgs; [
    agenix.packages.x86_64-linux.default
  ];

  age.identityPaths = [
    "/home/${myvars.username}/.ssh/id_ed25519"
  ];

  age.secrets = {
    mihomo = {
      file = ./mihomo.yaml.age;
      path = "/home/${myvars.username}/.config/mihomo/mihomo.yaml";
      owner = "mihomo";
      mode = "0600";
    };
  };
}

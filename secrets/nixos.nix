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
    age
  ];

  age.identityPaths = [
    "/home/${myvars.username}/.ssh/id_ed25519"
  ];

  age.secrets = {
    mihomo = {
      file = ../docs/mihomo/mihomo.yaml.age;
      path = "/home/${myvars.username}/.config/mihomo/mihomo.yaml";
    };
    #dae = {
    #  file = ../docs/dae/dae.yaml.age;
    #  path = "/home/${myvars.username}/.config/dae/dae.yaml.age";
    #};
  };
}

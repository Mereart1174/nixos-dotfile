{
  lib,
  config,
  pkgs,
  agenix,
  mysecrets,
  myvars,
  ...
}:
{
  imports = [ agenix.nixosModules.default ];
  environment.systemPackages = [ agenix.packages.x86_64-linux.default ];
  # "clash.yaml.age".publicKeys = [ mykey ];
}

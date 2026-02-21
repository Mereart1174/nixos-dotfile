{
  # NOTE: the args not used in this file CAN NOT be removed!
  # because haumea pass argument lazily,
  # and these arguments are used in the functions like `mylib.nixosSystem`, `mylib.colmenaSystem`, etc.
  inputs,
  lib,
  myvars,
  mylib,
  system,
  genSpecialArgs,
  nixos-wsl,
  ...
}@args:
let
  name = "wsl";
  base-modules = {
    nixos-modules =
      (map mylib.relativeToRoot [
        "secrets/nixos.nix"
        "system/base"
        "hosts/${name}"
      ]);
    home-modules =
      (map mylib.relativeToRoot [
        "home/base"
        "hosts/${name}/home.nix"
      ]);
  };

  modules-wsl = {
    nixos-modules = [
    ]
    ++ base-modules.nixos-modules;
    home-modules = [
    ]
    ++ base-modules.home-modules;
  };

in
{
  nixosConfigurations = {
    "${name}-nixos" = mylib.nixosSystem (modules-wsl // args);
  };

  packages = {
    "${name}-nixos" = inputs.self.nixosConfigurations."${name}-nixos".config.formats.iso;
  };
}

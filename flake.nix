{
    description = "My NixOS";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nur = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        rust-overlay = {
            url = "github:oxalica/rust-overlay";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland = {
            url = "github:hyprwm/Hyprland";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = input @ { self, nixpkgs, ... }:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
            lib = nixpkgs.lib;

            mkSystem = system: hostname:
                lib.nixosSystem {
                    system = system;
                    modules = [
                        { networking.hostName = hostname; }
                        ./system/default.nix
                        ./system/hardware/${hostname}.nix

                        input.hyprland.nixosModules.default
                        input.nur.nixosModules.nur
                        # ({ config, ... }:{
                        #     environment.systemPackages = [ config.nur.repos.linyinfeng.clash-for-windows ];
                        # })

                        input.home-manager.nixosModules.home-manager
                        {
                            home-manager = {
                                useUserPackages = true;
                                useGlobalPkgs = true;
                                extraSpecialArgs = { inherit input; };
                                users.phil = (./. + "/user/Philomatics.nix");
                            };
                        }
                    ];
                    specialArgs = { inherit input; };
                };
        in {
            nixosConfigurations = {
                magicbook = mkSystem "x86_64-linux" "magicbook";
            };
        };
}

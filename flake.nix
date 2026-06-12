{
  description = "NixOS configuration with Home Manager (KDE Plasma & Hyprland variants)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, ... }:
    let
      system = "x86_64-linux";

      # Used for both the NixOS user account and the Home Manager profile.
      username = "user";

      mkHost = { hostModule, homeModule }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit username; };
          modules = [
            ./modules/common.nix
            ./modules/gaming.nix
            hostModule
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "hm-bak";
              home-manager.extraSpecialArgs = { inherit username; };
              home-manager.sharedModules = [ catppuccin.homeManagerModules.catppuccin ];
              home-manager.users.${username} = import homeModule;
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        # sudo nixos-rebuild switch --flake .#kde
        kde = mkHost {
          hostModule = ./hosts/kde/configuration.nix;
          homeModule = ./home/kde.nix;
        };

        # sudo nixos-rebuild switch --flake .#hyprland
        hyprland = mkHost {
          hostModule = ./hosts/hyprland/configuration.nix;
          homeModule = ./home/hyprland.nix;
        };
      };
    };
}

{
  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    # substituers will be appended to the default substituters when fetching packages
    # nix com    extra-substituters = [munity's cache server
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main"; # WSL support
    # Spacemacs distribution as a flake input (content only)
    spacemacs = {
      url = "github:syl20bnr/spacemacs";
      flake = false;
    };
    myRepo = {
      url = "github:hizuhi/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nixos-wsl,
    myRepo,
    ...
  }: {
    nixosConfigurations = {
      jige-nixos = let
        username = "szy"; # another username for this machine
        specialArgs = {
	  inherit username inputs;
          enableDesktopApps = true;
	};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
            ./hosts/jige-nixos
            ./users/${username}/nixos.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              # Ensure HM backs up pre-existing files instead of failing
              home-manager.backupFileExtension = "hm-bak";

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
    };

    nixosConfigurations = {
      wsl = let
        username = "szy";
        specialArgs = {
          inherit username inputs;
          enableDesktopApps = false;
        };
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";

          modules = [
	     ({
              nixpkgs.overlays = [
                (final: prev: {
                  myRepo = inputs.myRepo.packages."${prev.system}";
                })
              ];
            })

            nixos-wsl.nixosModules.wsl
            ./hosts/wsl
            ./users/${username}/nixos.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              # Ensure HM backs up pre-existing files instead of failing
              home-manager.backupFileExtension = "hm-bak";

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
    };
  };
}

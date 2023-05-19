{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = github:nix-community/home-manager;
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }:
		let
		system = "x86_64-linux";
	pkgs = import nixpkgs {
		inherit system;
		config.allowUnfree = true;
	};
	lib = nixpkgs.lib;
	username = "david";
	in {
		nixosConfigurations = {
			laptop = lib.nixosSystem {
				inherit system;
				modules = [
					./hosts/laptop/configuration.nix
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.david = { 
							imports = [ ./home/configuration.nix ];
						};
						home-manager.users.david.home.stateVersion = "22.05";
					}
				];
			};
		};
	};
}

{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        inputs.hjem.nixosModules.default
        ./configuration.nix
      ];

      inputs.hjem = {
        clobberByDefault = true;

        users.parsa = {
          directory = "/home/parsa";

          xdg.config.files = {
            "fish".source = ./dotfiles/parsa/fish;
          };
        };
      };
    };
  };
}

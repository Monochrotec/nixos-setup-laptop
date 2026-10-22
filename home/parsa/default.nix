{ config, pkgs, ... }:

{
  home-manager.users."parsa" = {
    imports = [
      ./fish.nix
      ./foot.nix
      ./helix.nix
      ./niri.nix
    ];

    home.stateVersion = "26.05";
  };
}

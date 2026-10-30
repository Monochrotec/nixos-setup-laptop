{
  home-manager.users."parsa" = {
    imports = [
      ./fish.nix
      ./foot.nix
      ./helix.nix
      ./niri.nix
      ./noctalia.nix
    ];
    stylix.targets.gtk.flatpakSupport.enable = false;
    home.stateVersion = "26.05";
  };
}

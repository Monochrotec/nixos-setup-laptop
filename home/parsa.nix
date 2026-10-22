{ config, pkgs, ... }: {
  home = {
    username = "parsa";
    homeDirectory = "/home/parsa";
    stateVersion = "26.05";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = "set -gx EDITOR hx";
  };

  wayland.windowManager.niri = {
    enable = true;
    settings = import ./parsa/niri.nix;
  };
}

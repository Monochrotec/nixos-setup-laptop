{
  lib,
  pkgs,
  ...
}:

{
  stylix.targets.helix.enable = false;

  programs.helix = {
    enable = true;
    settings = {
      theme = "nord";
    };
    languages.language = [
      {
        name = "nix";
        autoformat = true;
        formatter.command = lib.getExe pkgs.nixfmt;
      }
    ];
  };
}

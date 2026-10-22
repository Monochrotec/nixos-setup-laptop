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
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt;
      }
    ];
  };
}

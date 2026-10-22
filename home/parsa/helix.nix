{
  config.stylix.targets.helix.enable = false;

  programs.helix = {
    enable = true;
    language = [
      {
        name = "nix";
        autoformat = true;
        formatter.command = (lib.getExe pkgs.nixfmt);
      }
    ];
  };
}

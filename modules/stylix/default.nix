{ config, pkgs, ... }:

{
  config.stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = themes/nord.yaml;

    fonts =
      let
        font = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetbrainsMono NF";
        };

        size = 11;
      in
      {
        serif = font;
        sansSerif = font;
        monospace = font;

        sizes = {
          applications = size;
          desktop = size;
        };
      };
  };
}

{
  config,
  lib,
  pkgs,
  ...
}:

let
  # defaultProfile = profiles/nordtheme.json;
in
{
  services.hardware.openrgb = {
    enable = true;
    # startupProfile = defaultProfile;
  };
}

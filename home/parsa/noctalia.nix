{
  programs.noctalia = {
    enable = true;

    settings = {
      bar.default = {
        start = [
          "keyboard_layout"
          "wallpaper"
          "workspaces"
        ];
        end = [
          "media"
          "tray"
          "notifications"
          "clipboard"
          "network"
          "bluetooth"
          "volume"
          "brightness"
          "battery"
          "session"
        ];
        position = "left";
      };
    };
  };
}

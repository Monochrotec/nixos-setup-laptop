{
  programs.noctalia = {
    enable = true;

    settings = {
      bar.default = {
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

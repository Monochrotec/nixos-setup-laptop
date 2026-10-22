{
  wayland.windowManager.niri = {
    enable = true;
    settings = {
      _children = [
        { spawn-at-startup = "noctalia"; }

        {
          window-rule = {
            geometry-corner-radius = 0;
            clip-to-geometry = true;
          };
        }
      ];

      prefer-no-csd = { };

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      input = {
        keyboard = {
          xkb = {
            layout = "us,gb";
            options = "grp:alt_ralt_toggle,ctrl:nocaps";
          };
        };

        touchpad = {
          tap = { };
          natural-scroll = { };
        };

        warp-mouse-to-focus = { };
        focus-follows-mouse._props.max-scroll-amount = "50%";
      };

      output = {
        _args = [ "eDP-1" ];
        scale = 1;
      };

      layout = {
        gaps = 16;
        center-focused-column = "never";

        preset-column-widths._children = [
          { proportion = 1. / 3; }
          { proportion = 1. / 2; }
          { proportion = 2. / 3; }
        ];

        default-column-width.proportion = 1. / 2;

        focus-ring.off = { };

        border = {
          width = 2;

          active-color = "#ffc87f";
          inactive-color = "#505050";
          urgent-color = "#9b0000";
        };
      };

      hotkey-overlay.skip-at-startup = { };

      binds = {
        "Mod+Return".spawn = "foot";
        "Mod+Space".spawn-sh = "noctalia msg panel-open launcher";
        "Mod+V".spawn-sh = "noctalia msg panel-open clipboard";

        # audio control
        XF86AudioRaiseVolume = {
          _props.allow-when-locked = true;
          spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
        };
        XF86AudioLowerVolume = {
          _props.allow-when-locked = true;
          spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
        };
        XF86AudioMute = {
          _props.allow-when-locked = true;
          spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
        XF86AudioMicMute = {
          _props.allow-when-locked = true;
          spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };

        # media control
        XF86AudioPlay = {
          _props.allow-when-locked = true;
          spawn-sh = "playerctl play-pause";
        };
        XF86AudioStop = {
          _props.allow-when-locked = true;
          spawn-sh = "playerctl stop";
        };
        XF86AudioPrev = {
          _props.allow-when-locked = true;
          spawn-sh = "playerctl previous";
        };
        XF86AudioNext = {
          _props.allow-when-locked = true;
          spawn-sh = "playerctl next";
        };

        "Mod+Tab" = {
          _props.repeat = false;
          toggle-overview = { };
        };

        "Mod+Q" = {
          _props.repeat = false;
          close-window = { };
        };

        # focusing windows/columns
        "Mod+H".focus-column-left = { };
        "Mod+J".focus-window-down = { };
        "Mod+K".focus-window-up = { };
        "Mod+L".focus-column-right = { };

        "Mod+Ctrl+WheelScrollDown".focus-column-right = { };
        "Mod+Ctrl+WheelScrollUp".focus-column-left = { };

        # moving windows/columns
        "Mod+Shift+H".move-column-left = { };
        "Mod+Shift+J".move-window-down = { };
        "Mod+Shift+K".move-window-up = { };
        "Mod+Shift+L".move-column-right = { };

        "Mod+Ctrl+Shift+WheelScrollDown".move-column-right = { };
        "Mod+Ctrl+Shift+WheelScrollUp".move-column-left = { };

        # focusing/moving workspaces
        _children =
          let
            workspaceNumbers = [
              1
              2
              3
              4
              5
              6
              7
              8
              9
            ];

            focusWorkspaceByNumber = map (x: {
              "Mod+${toString x}".focus-workspace = x;
            }) workspaceNumbers;

            moveToWorkspaceByNumber = map (x: {
              "Mod+Shift+${toString x}".move-column-to-workspace = x;
            }) workspaceNumbers;
          in
          [
            { _children = focusWorkspaceByNumber; }
            { _children = moveToWorkspaceByNumber; }
          ];

        "Mod+Shift+U".move-workspace-down = { };
        "Mod+Shift+I".move-workspace-up = { };

        "Mod+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          focus-workspace-down = { };
        };
        "Mod+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          focus-workspace-up = { };
        };
        "Mod+Shift+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          move-column-to-workspace-down = { };
        };
        "Mod+Shift+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          move-column-to-workspace-up = { };
        };

        # Moving windows in and out of a column
        "Mod+BracketLeft".consume-or-expel-window-left = { };
        "Mod+BracketRight".consume-or-expel-window-right = { };

        # Cycle through widths set in preset-column-widths
        "Mod+R".switch-preset-column-width = { };
        "Mod+Shift+R".switch-preset-column-width-back = { };

        "Mod+F".maximize-column = { };
        "Mod+Shift+F".toggle-window-floating = { };
        "Mod+Ctrl+F".switch-focus-between-floating-and-tiling = { };

        "Mod+C".center-column = { };

        # Finer width adjustments
        "Mod+Minus".set-column-width = "-10%";
        "Mod+Equal".set-column-width = "+10%";

        # Finer height adjustments
        "Mod+Shift+Minus".set-window-height = "-10%";
        "Mod+Shift+Equal".set-window-height = "+10%";

        # ScreenShotting
        "Print".screenshot = { };
        "Ctrl+Print".screenshot-screen = { };
        "Alt+Print".screenshot-window = { };

        # when a programs captures all the inputs. stop capturing the inputs
        "Mod+Escape" = {
          _props.allow-inhibiting = false;
          toggle-keyboard-shortcuts-inhibit = { };
        };

        # Power of all monitors
        "Mod+Shift+P".power-off-monitors = { };
      };
    };
  };
}

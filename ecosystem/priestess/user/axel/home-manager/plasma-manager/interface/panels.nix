_: {
  programs.plasma.panels = [
    {
      location = "top";
      alignment = "center";
      floating = false;
      height = 36;
      hiding = "none";
      lengthMode = "fill";
      opacity = "opaque";

      widgets = [
        "org.kde.plasma.showdesktop"
        {
          pager.general = {
            showWindowOutlines = false;
            showApplicationIconsOnWindowOutlines = false;
            showOnlyCurrentScreen = false;
            navigationWrapsAround = false;
            displayedText = "desktopName";
          };
        }
        {
          iconTasks = {
            launchers = [ ];
          };
        }
        "org.kde.plasma.panelspacer"
        {
          digitalClock = {
            date.format.custom = "ddd, d MMM";
            calendar.firstDayOfWeek = "monday";
          };
        }
        "org.kde.plasma.panelspacer"
        {
          systemTray.items = {
            shown = [
              "org.kde.plasma.networkmanagement"
              "org.kde.plasma.volume"
              "org.kde.plasma.battery"
              "org.kde.plasma.brightness"
            ];

            hidden = [
              "org.kde.plasma.clipboard"
              "org.kde.plasma.bluetooth"
              "org.kde.plasma.mediacontrol"
            ];
          };
        }

        {
          kickoff.icon = "nix-snowflake";
        }
      ];
    }
  ];
}

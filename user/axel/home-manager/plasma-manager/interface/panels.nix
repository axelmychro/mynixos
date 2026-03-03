_: {
  programs.plasma.panels = [
    {
      location = "top";
      alignment = "center";
      floating = false;
      height = 36;
      hiding = "none";
      lengthMode = "fill";

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
          systemMonitor = {
            title = "Memory";
            displayStyle = "org.kde.ksysguard.textonly";
            sensors = [
              {
                name = "memory/physical/usedPercent";
                label = "";
                color = "129,200,190";
              }
            ];
          };
        }
        {
          systemMonitor = {
            title = "CPU";
            displayStyle = "org.kde.ksysguard.textonly";
            sensors = [
              {
                name = "cpu/all/usage";
                label = "";
                color = "140,170,238";
              }
            ];
          };
        }
        {
          systemMonitor = {
            title = "GPU";
            displayStyle = "org.kde.ksysguard.textonly";
            sensors = [
              {
                name = "gpu/gpu0/usage";
                label = "󰈈";
                color = "166,209,137";
              }
            ];
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
          systemMonitor = {
            title = "Temperature";
            displayStyle = "org.kde.ksysguard.textonly";
            sensors = [
              {
                name = "cpu/all/maximumTemperature";
                label = "";
                color = "231,130,132";
              }
            ];
          };
        }
        {
          systemMonitor = {
            title = "Storage";
            displayStyle = "org.kde.ksysguard.textonly";
            sensors = [
              {
                name = "disk/all/usedPercent";
                label = "";
                color = "241,240,186";
              }
            ];
          };
        }
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

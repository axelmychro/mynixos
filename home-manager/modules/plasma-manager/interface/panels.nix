_:
# let
#   browser = "app.zen_browser.zen.desktop";
#   editor = "dev.zed.Zed.desktop";
# in
{
  programs.plasma.panels = [
    {
      location = "top";
      alignment = "center";
      floating = false;
      height = 36;
      hiding = "none";
      lengthMode = "fill";
      widgets = [
        {
          kickoff = {
            icon = "nix-snowflake";
          };
        }
        {
          pager = {
            general = {
              showWindowOutlines = false;
              showApplicationIconsOnWindowOutlines = false;
              showOnlyCurrentScreen = false;
              navigationWrapsAround = false;
              displayedText = "desktopName";
            };
          };
        }
        # {
        #   iconTasks = {
        #     launchers = [
        #       "applications:${browser}"
        #       "applications:${editor}"
        #     ];
        #   };
        # }
        "org.kde.plasma.systemmonitor.cpu"
        "org.kde.plasma.systemmonitor.memory"
        "org.kde.plasma.systemmonitor.diskactivity"
        "org.kde.plasma.panelspacer"
        {
          digitalClock = {
            date.format.custom = "ddd, d MMM";
            calendar.firstDayOfWeek = "monday";
          };
        }
        "org.kde.plasma.panelspacer"
        {
          systemTray = {
            items = {
              shown = [
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.battery"
                "org.kde.plasma.volume"
              ];
              hidden = [
                "org.kde.plasma.clipboard"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.mediacontrol"
                "org.kde.plasma.brightness"
              ];
            };
          };
        }
        "org.kde.plasma.showdesktop"
      ];
    }
  ];
}

_:
let
  browser = "app.zen_browser.zen.desktop";
  editor = "dev.zed.Zed.desktop";
in
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
        "org.kde.plasma.pager"
        {
          iconTasks = {
            launchers = [
              "applications:${browser}"
              "applications:${editor}"
            ];
          };
        }
        {
          digitalClock = {
            date.format.custom = "ddd, d MMM";
            calendar.firstDayOfWeek = "monday";
          };
        }
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

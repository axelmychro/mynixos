_:
let
  browser = "app.zen_browser.zen.desktop";
  editor = "dev.zed.Zed.desktop";
in
{
  programs.plasma = {
    panels = [
      {
        alignment = "right";
        floating = false;
        height = 48;
        hiding = "none";
        lengthMode = "fill";
        location = "right";
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
            systemTray = {
              items = {
                shown = [
                  "org.kde.plasma.networkmanagement"
                  "org.kde.plasma.battery"
                ];
                hidden = [
                  "org.kde.plasma.clipboard"
                  "org.kde.plasma.volume"
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
  };
}

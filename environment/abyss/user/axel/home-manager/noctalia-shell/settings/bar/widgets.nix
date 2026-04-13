{ abyssAssets, ... }:
{
  home.file.".icon".source = "${abyssAssets}/icon.png";
  programs.noctalia-shell.settings.bar.widgets = {
    left = [
      {
        id = "Workspace";
        hideUnoccupied = false;
        labelMode = "none";
      }
      {
        id = "Network";
      }
      {
        id = "Bluetooth";
      }
    ];
    center = [
      {
        id = "Clock";
        formatHorizontal = "hh:mm A";
        formatVertical = "hh mm A";
        useMonospacedFont = true;
        usePrimaryColor = true;
      }
    ];
    right = [
      {
        id = "Tray";
        chevronColorKey = "mSecondary";
      }
      {
        id = "Volume";
      }
      {
        id = "Brightness";
      }
      {
        id = "Battery";
        displayMode = "graphic";
        showPercentageText = true;
        showPowerProfiles = true;
        showNoctaliaPerformance = true;
        warningThreshold = 50;
      }
      {
        id = "NotificationHistory";
      }
    ];
  };
}

{ config, ... }:
{
  home.file.".icon".source = ../../../../assets/icon.png;
  programs.noctalia-shell.settings.bar.widgets = {
    left = [
      {
        id = "ControlCenter";
        enableColorization = true;
        useDistroLogo = false;
        customIconPath = "${config.home.homeDirectory}/.icon";
      }
      {
        id = "Network";
      }
      {
        id = "Bluetooth";
      }
      {
        id = "PowerProfile";
      }
    ];
    center = [
      {
        id = "Workspace";
        hideUnoccupied = false;
        labelMode = "none";
      }
    ];
    right = [
      {
        formatHorizontal = "dd MMM, hh:mm a";
        formatVertical = "dd MMM hh mm";
        id = "Clock";
        useMonospacedFont = true;
        usePrimaryColor = true;
      }
      {
        id = "Brightness";
      }
      {
        id = "Volume";
      }
      {
        id = "Battery";
        showPercentageText = true;
        warningThreshold = 50;
      }
      {
        id = "Tray";
      }
      {
        id = "NotificationHistory";
      }
    ];
  };
}

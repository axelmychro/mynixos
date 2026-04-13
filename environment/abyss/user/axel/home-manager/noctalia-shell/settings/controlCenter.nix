_: {
  programs.noctalia-shell.settings.controlCenter = {
    position = "close_to_bar_button";
    diskPath = "/";
    cards = [
      {
        id = "profile-card";
        enabled = true;
      }
      {
        enabled = true;
        id = "shortcuts-card";
      }
      {
        enabled = false;
        id = "audio-card";
      }
      {
        enabled = false;
        id = "brightness-card";
      }
      {
        enabled = true;
        id = "media-sysmon-card";
      }
      {
        enabled = false;
        id = "weather-card";
      }
    ];
    shortcuts = {
      left = [
        {
          id = "AirplaneMode";
        }
        {
          id = "WallpaperSelector";
        }
        {
          id = "NightLight";
        }
        {
          id = "KeepAwake";
        }
      ];
      right = [ ];
    };
  };
}

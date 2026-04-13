_: {
  programs.noctalia-shell.settings.sessionMenu = {
    enableCountdown = true;
    countdownDuration = 10000;
    position = "center";
    showHeader = false;
    showKeybinds = false;
    largeButtonsStyle = true;
    largeButtonsLayout = "single-row"; # or grid
    powerOptions = [
      {
        action = "shutdown";
        enabled = true;
        keybind = "1";
      }
      {
        action = "reboot";
        enabled = true;
        keybind = "2";
      }
      {
        action = "logout";
        enabled = true;
        keybind = "3";
      }
      {
        action = "lock";
        enabled = false;
        keybind = "6";
      }
      {
        action = "suspend";
        enabled = false;
        keybind = "4";
      }
      {
        action = "hibernate";
        enabled = false;
        keybind = "5";
      }
      {
        action = "rebootToUefi";
        enabled = false;
        keybind = "7";
      }
    ];
  };
}

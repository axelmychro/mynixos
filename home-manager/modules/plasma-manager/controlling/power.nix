{ ... }:
{
  programs.plasma = {
    powerdevil = {
      AC = {
        autoSuspend = {
          action = "sleep";
          idleTimeout = 1200; # 20 mins
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 600; # 20 mins
        };
        displayBrightness = null;
        powerButtonAction = "nothing";
        powerProfile = "balanced";
        turnOffDisplay = {
          idleTimeout = 300;
          idleTimeoutWhenLocked = 20;
        };
        whenLaptopLidClosed = "doNothing";
      };
      battery = {
        autoSuspend = {
          action = "sleep";
          idleTimeout = 600; # 10 mins
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 150;
        };
        displayBrightness = null;
        powerButtonAction = "nothing";
        powerProfile = "powerSaving";
        turnOffDisplay = {
          idleTimeout = 300;
          idleTimeoutWhenLocked = 20;
        };
        whenLaptopLidClosed = "sleep";
      };
      lowBattery = {
        autoSuspend = {
          action = "shutDown";
          idleTimeout = 300; # 20 mins
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 75;
        };
        displayBrightness = null;
        powerButtonAction = "shutDown";
        powerProfile = "powerSaving";
        turnOffDisplay = {
          idleTimeout = 150;
          idleTimeoutWhenLocked = "immediately";
        };
        whenLaptopLidClosed = "shutDown";
      };
    };
  };
}

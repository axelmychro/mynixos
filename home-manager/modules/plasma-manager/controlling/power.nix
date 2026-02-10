{ ... }:
{
  programs.plasma = {
    powerdevil = {
      AC = {
        powerButtonAction = "nothing";
        turnOffDisplay = {
          idleTimeout = 300;
          idleTimeoutWhenLocked = "immediately"; # 300 + 0 = "immediately"
        };
        # autoSuspend = {
        #   action = "shutDown";
        #   idleTimeout = 1200; # 20 mins
        # };
      };
      battery = {
        powerButtonAction = "nothing";
        autoSuspend = {
          action = "sleep";
          idleTimeout = 900;
        };
      };
      lowBattery = {
        whenLaptopLidClosed = "shutDown";
      };
    };
  };
}

_: {
  services = {
    thermald.enable = true;
    power-profiles-daemon.enable = true; # pp daemon conflicts with tlp
    # tlp = {
    #   enable = true;
    #   settings = {
    #     START_CHARGE_THRESH_BAT0 = 0;
    #     STOP_CHARGE_THRESH_BAT0 = 1;
    #   };
    # };
  };
}

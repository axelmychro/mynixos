{
  pkgs,
  ...
}:
{
  services = {
    power-profiles-daemon.enable = false;
    tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = 0;
        STOP_CHARGE_THRESH_BAT0 = 1;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    tlp
  ];
}

{ ... }:
let
  sans = "UbuntuSans Nerd Font";
  code = "FiraCode Nerd Font";
in
{
  programs.plasma = {
    workspace = {
      wallpaper = ../assets/desktop.jpg;
      iconTheme = "breeze-dark";
      cursor = {
        animationTime = 5;
        cursorFeedback = "Bouncing";
        size = 36;
        taskManagerFeedback = true;
        theme = "Breeze_Light";
      };
    };
    kscreenlocker.appearance = {
      wallpaper = ../assets/lock.jpg;
      alwaysShowClock = true;
      showMediaControls = true;
    };
    fonts = {
      general = {
        family = sans;
        pointSize = 12;
      };
      fixedWidth = {
        family = code;
        pointSize = 12;
      };
      small = {
        family = sans;
        pointSize = 10;
      };
      toolbar = {
        family = sans;
        pointSize = 12;
      };
      menu = {
        family = sans;
        pointSize = 12;
      };
      windowTitle = {
        family = sans;
        pointSize = 12;
      };
    };
  };
}

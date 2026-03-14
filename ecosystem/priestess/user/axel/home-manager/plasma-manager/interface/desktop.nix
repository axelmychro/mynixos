_:
let
  sans = "UbuntuSans Nerd Font";
  code = "FiraCode Nerd Font";
in
{
  programs.plasma = {
    workspace = {
      wallpaper = ../assets/desktop.jpg;
      lookAndFeel = null;
      colorScheme = "CatppuccinFrappe";
      theme = null; # plasma style. null = default
      windowDecorations = {
        theme = "Breeze";
        library = "org.kde.breeze";
      };
      iconTheme = "breeze-dark";
      cursor = {
        animationTime = 5;
        cursorFeedback = "Bouncing";
        size = 36;
        taskManagerFeedback = true;
        theme = "Breeze_Light";
      };
      soundTheme = "ocean";
      splashScreen = {
        engine = "none";
        theme = "None";
      };
    };
    kscreenlocker.appearance = {
      wallpaper = ../assets/lock.jpg;
      alwaysShowClock = true;
      showMediaControls = true; # for spotify too
    };
    kwin = {
      nightLight = {
        enable = true;
        mode = "times";
        time = {
          evening = "17:30";
          morning = "06:30";
        };
      };
      effects = {
        hideCursor = {
          hideOnInactivity = 10;
          hideOnTyping = true;
        };
        shakeCursor.enable = true;
        wobblyWindows.enable = true;
      };
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

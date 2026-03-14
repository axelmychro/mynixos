_: {
  programs.plasma = {
    kwin = {
      titlebarButtons = {
        left = [ ];
        right = [ ]; # note: null value is actually default. leave an empty string instead
      };
    };
    configFile.kwinrc.Windows = {
      BorderlessMaximizedWindows = true;
      FocusPolicy = "FocusFollowsMouse";
      AutoRaise = true;
      AutoRaiseInterval = 0;
      DelayFocusInterval = 0;
    };
  };
}

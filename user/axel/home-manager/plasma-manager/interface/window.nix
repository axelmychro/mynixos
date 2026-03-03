_: {
  programs.plasma = {
    kwin = {
      titlebarButtons = {
        left = [
          "close"
          "maximize"
          "minimize"
        ];
        right = [ ]; # note: null value is actually default. leave an empty string instead
      };
    };
    configFile.kwinrc.Windows = {
      FocusPolicy = "FocusFollowsMouse";
      AutoRaise = true;
      AutoRaiseInterval = 0;
      DelayFocusInterval = 0;
    };
  };
}

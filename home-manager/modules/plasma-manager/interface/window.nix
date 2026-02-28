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
      scripts.polonium = {
        enable = true;
        settings = {
          layout = {
            engine = "binaryTree";
            insertionPoint = "activeWindow";
          };
          enableDebug = true;
          borderVisibility = "noBorderAll";
          maximizeSingleWindow = false;
          tilePopups = false;
        };
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

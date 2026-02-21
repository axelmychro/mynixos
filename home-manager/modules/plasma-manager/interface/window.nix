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
      borderlessMaximizedWindows = true;
    };
  };
}

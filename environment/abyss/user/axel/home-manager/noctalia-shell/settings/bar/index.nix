_: {
  programs.noctalia-shell.settings.bar = {
    barType = "simple";
    position = "left";

    backgroundOpacity = 1;
    useSeparateOpacity = false;

    density = "spacious";
    displayMode = "always_visible";
    showOnWorkspaceSwitch = true;
    showOutline = false;
    showCapsule = true;
    capsuleOpacity = 1;
    capsuleColorKey = "none";

    outerCorners = true;
    floating = false;
    fontScale = 1.0;
    widgetSpacing = 24;
    contentPadding = 0;
    frameThickness = 8;
    frameRadius = 8;
    marginVertical = 12;
    marginHorizontal = 12;

    hideOnOverview = false;
    autoHideDelay = 500;
    autoShowDelay = 150;
  };
  imports = [ ./widgets.nix ];
}

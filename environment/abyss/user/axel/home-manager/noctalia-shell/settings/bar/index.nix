_: {
  programs.noctalia-shell.settings.bar = {
    barType = "floating";
    position = "right";

    backgroundOpacity = 1;
    useSeparateOpacity = false;

    density = "default";
    displayMode = "always_visible";
    showOnWorkspaceSwitch = true;
    showOutline = false;
    showCapsule = true;
    capsuleOpacity = 1;
    capsuleColorKey = "none";

    outerCorners = false;
    floating = true;
    fontScale = 1;
    widgetSpacing = 16;
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

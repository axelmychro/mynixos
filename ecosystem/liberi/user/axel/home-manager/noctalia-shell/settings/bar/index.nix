_: {
  programs.noctalia-shell.settings.bar = {
    barType = "framed";
    position = "bottom";

    backgroundOpacity = 1;
    useSeparateOpacity = true;

    density = "default";
    displayMode = "always_visible";
    showOnWorkspaceSwitch = true;
    showOutline = false;
    showCapsule = true;
    capsuleOpacity = 1;
    capsuleColorKey = "none";

    floating = false;
    fontScale = 1;
    widgetSpacing = 8;
    contentPadding = 16;
    frameThickness = 8;
    frameRadius = 12;
    outerCorners = true;
    marginVertical = 0;
    marginHorizontal = 0;

    hideOnOverview = false;
    autoHideDelay = 500;
    autoShowDelay = 150;
  };
  imports = [ ./widgets.nix ];
}

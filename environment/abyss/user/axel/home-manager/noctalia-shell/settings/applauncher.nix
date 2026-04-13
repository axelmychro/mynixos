_: {
  programs.noctalia-shell.settings.appLauncher = {
    enableClipboardHistory = false;
    autoPasteClipboard = false;
    enableClipPreview = true;
    clipboardWrapText = true;
    clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
    clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
    position = "center";
    pinnedApps = [ ];
    useApp2Unit = false;
    sortByMostUsed = true;
    terminalCommand = "ghostty -e";
    customLaunchPrefixEnabled = false;
    customLaunchPrefix = "";
    viewMode = "grid";
    showCategories = true;
    iconMode = "tabler";
    showIconBackground = false;
    enableSettingsSearch = true;
    enableWindowsSearch = true;
    enableSessionSearch = true;
    ignoreMouseInput = false;
    screenshotAnnotationTool = "";
    overviewLayer = false;
    density = "comfortable";
  };
}

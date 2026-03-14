_: {
  programs.fish.shellAliases = {
    x = "exit";
    bb = "exec fish";

    wd = "waydroid";
    wds = "waydroid show-full-ui";
    wdx = "waydroid session stop && sudo systemctl stop waydroid-container";
  };
}

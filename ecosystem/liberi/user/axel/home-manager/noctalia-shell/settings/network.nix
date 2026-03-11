_: {
  programs.noctalia-shell.settings.network = {
    wifiEnabled = true;
    airplaneModeEnabled = false;
    bluetoothRssiPollingEnabled = false;
    bluetoothRssiPollIntervalMs = 60000;
    networkPanelView = "wifi";
    wifiDetailsViewMode = "grid";
    bluetoothDetailsViewMode = "grid";
    bluetoothHideUnnamedDevices = false;
    disableDiscoverability = false;
    bluetoothAutoConnect = false;
  };
}

_: {
  programs.noctalia-shell.settings.systemMonitor = {
    cpuWarningThreshold = 80;
    cpuCriticalThreshold = 90;
    tempWarningThreshold = 80;
    tempCriticalThreshold = 90;
    gpuWarningThreshold = 80;
    gpuCriticalThreshold = 90;
    memWarningThreshold = 80;
    memCriticalThreshold = 90;
    swapWarningThreshold = 80;
    swapCriticalThreshold = 90;
    diskWarningThreshold = 80;
    diskCriticalThreshold = 90;
    diskAvailWarningThreshold = 20;
    diskAvailCriticalThreshold = 10;
    batteryWarningThreshold = 50;
    batteryCriticalThreshold = 20;
    enableDgpuMonitoring = false;
    useCustomColors = false;
    warningColor = "";
    criticalColor = "";
    externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
  };
}

{
  config,
  pkgs,
  ...
}:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      open = true;
      modesetting.enable = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
        sync.enable = false; # only enable if you hate your laptop
        reverseSync.enable = false; # this is a laptop, please NEVER enable
      };
      powerManagement = {
        enable = true;
        finegrained = true;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
    vulkan-tools
  ];
}

{
  config,
  pkgs,
  ...
}:
{
  hardware = {
    enableRedistributableFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
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
  services.xserver = {
    enable = false;
    videoDrivers = [ "nvidia" ];
  };
  environment = {
    sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
    systemPackages = with pkgs; [
      libva-utils
      mesa-demos
      nvtopPackages.nvidia
      vulkan-tools
      pciutils
    ];
  };
  boot.kernelParams = [ "i915.enable_guc=3" ];
}

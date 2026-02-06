{
  lib,
  pkgs,
  ...
}:
{
  networking = {
    firewall = {
      enable = true;
      allowPing = false;
      logReversePathDrops = true;
      extraCommands = "ip6tables -A INPUT -p icmpv6 --icmpv6-type echo-request -j DROP";
    };
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };
  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [
      "1.1.1.1"
      "1.0.0.1"
    ];
    dnsovertls = "true";
  };

  services.opensnitch = {
    enable = true;

    settings = {
      DefaultAction = "deny";
      DefaultDuration = "always";
      ProcMonitorMethod = "ebpf";
    };

    rules = {
      cloudflare-warp = {
        name = "cloudflare-warp";
        enabled = true;
        action = "allow";
        duration = "always";
        operator = {
          type = "simple";
          sensitive = false;
          operand = "process.path";
          data = "${lib.getBin pkgs.cloudflare-warp}/bin/warp-svc";
        };
      };

      systemd-resolved = {
        name = "systemd-resolved";
        enabled = true;
        action = "allow";
        duration = "always";
        operator = {
          type = "simple";
          sensitive = false;
          operand = "process.path";
          data = "${lib.getBin pkgs.systemd}/lib/systemd/systemd-resolved";
        };
      };

      flatpak = {
        name = "flatpak";
        enabled = true;
        action = "allow";
        duration = "always";
        operator = {
          type = "simple";
          operand = "process.path";
          data = "${pkgs.flatpak}/bin/flatpak";
        };
      };
    };
  };

  services.cloudflare-warp.enable = true;
  systemd.user.services.warp-connect = {
    description = "Connect to Cloudflare WARP on login";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.cloudflare-warp}/bin/warp-cli --accept-tos connect";
      RemainderAfterExit = true;
    };
    wantedBy = [ "default.target" ];
    after = [ "network.target" ];
  };
}

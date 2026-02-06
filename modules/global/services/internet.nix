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

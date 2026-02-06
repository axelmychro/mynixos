{
  pkgs,
  ...
}:
{
  networking = {
    firewall.enable = true;
    nameservers = [ "1.1.1.1" ];
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

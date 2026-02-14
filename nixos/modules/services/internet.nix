_: {
  networking = {
    firewall = {
      enable = true;
      allowPing = true;
      logReversePathDrops = true;
    };
    nameservers = [
      "1.1.1.1"
    ];
  };

  services.resolved = {
    enable = true;
    extraConfig = ''
      [Resolve]
      DNS=1.1.1.1#cloudflare-dns.com 1.0.0.1#cloudflare-dns.com
      FallbackDNS=9.9.9.9#dns.quad9.net
      DNSOverTLS=yes
      DNSSEC=yes
      Domains=~.
    '';
  };
}

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
    dnsovertls = "true";
    dnssec = "true";
    domains = [ "~." ];
  };
}

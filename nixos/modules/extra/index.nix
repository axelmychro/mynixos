_: {
  boot.loader.systemd-boot.extraEntries = {
    "void.conf" = ''
      title   Void Linux
      linux   /vmlinuz-void
      initrd  /initrd-void
      options root=UUID=a3744299-cd58-4298-8c01-1a56c2b7a2c9
    '';
  };
}

_: {
  boot.loader.grub.extraEntries = ''
    ${builtins.readFile ./gentoo}
    ${builtins.readFile ./artix}
  '';
}

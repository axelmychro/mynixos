_: {
  boot.loader.grub.extraEntries = ''
    menuentry "Arch" --class arch {
      insmod gzio
      insmod part_gpt
      insmod ext2
      search --no-floppy --fs-uuid --set=root 76453cef-69c4-4779-8032-d8cc4776a21d
      linux /boot/vmlinuz-linux root=UUID=76453cef-69c4-4779-8032-d8cc4776a21d rw nvidia_drm.modeset=1
      initrd /boot/intel-ucode.img /boot/initramfs-linux.img
    }
  '';
}

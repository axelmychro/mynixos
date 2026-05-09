_:
let
  bootPartition = "800C-0267";
  gentooPartition = "/dev/nvme0n1p3";
  gentooKernelDir = "kernels-gentoo";
  zenKernelDir = "kernels-zen";
in
{
  boot.loader.grub.extraEntries = ''
    submenu 'Gentoo' --class gentoo {
      menuentry 'gentoo-kernel-bin' --class gentoo --class gnu-linux --class gnu --class os {
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root ${bootPartition}
        linux /${gentooKernelDir}/vmlinuz root=${gentooPartition} rw quiet loglevel=3 nowatchdog fsck.mode=force fsck.repair=yes
        initrd /${gentooKernelDir}/initramfs.img
      }
      menuentry 'zen-sources' --class gentoo --class gnu-linux --class gnu --class os {
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=root ${bootPartition}
        linux /${zenKernelDir}/vmlinuz root=${gentooPartition} rw quiet
        initrd /${zenKernelDir}/initramfs.img
      }
    }
  '';
}

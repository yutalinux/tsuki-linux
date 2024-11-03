#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="tsuki-linux"
iso_label="TSUKI_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Yuta <https://github.com/yutalinux>"
iso_application="Tsuki Linux"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="tsuki"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
           'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="erofs"
airootfs_image_tool_options=('-zlzma,109' -E 'ztailpacking')
bootstrap_tarball_compression=(zstd -c -T0 --long -19)
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/pacman.d/hooks/init_iso.hook"]="0:0:644"
  ["/home/live/.xprofile"]="0:0:755"
  ["/usr/bin/init_iso.sh"]="0:0:755"
  ["/usr/bin/install-tsuki-linux"]="0:0:755"
)

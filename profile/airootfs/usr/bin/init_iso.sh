#!/bin/bash

if [ "$CHROOT" = "true" ]; then
  exit
fi

pacman -Syy

pacman-key --init
pacman-key --populate archlinux

echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

useradd -m -G wheel -s /bin/bash live
chown -R live:live /home/live
chmod 755 /home/live

systemctl enable NetworkManager
reflector --save /etc/pacman.d/mirrorlist --country Japan --protocol https --latest 5

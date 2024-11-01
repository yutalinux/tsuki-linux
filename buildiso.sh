#!/bin/bash

MAKEFLAGS="-j$(nproc)"

sudo mount -t tmpfs -o size=8G tmpfs /mnt/ramdisk

sudo mkarchiso -v -w /mnt/ramdisk profile

sudo umount /mnt/ramdisk
sudo rm -rf work

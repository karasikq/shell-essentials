#!/bin/sh
read -p "Boot partition: " boot_partition
read -p "EFI partition: " efi_partition
echo -e "\nBoot: $boot_partition\nEFI:$efi_partition"
read -p "Continue? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
sudo su
mount $boot_partition /mnt/boot
mount $efi_partition /mnt/boot/efi
ls /mnt/boot/efi
for dir in /dev /proc /sys /run; do mount --bind $dir /mnt/$dir ; done
chroot /mnt
dnf reinstall grub2-efi shim -y
grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

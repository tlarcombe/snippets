#!/bin/bash

# Update the system clock
timedatectl set-ntp true

# Partition the disk
fdisk /dev/sda

# Format the partitions
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2

# Mount the filesystem - home on a seperate partition, but would be better on a seperate disk
mount /dev/sda1 /mnt
mkdir /mnt/home
mount /dev/sda2 /mnt/home

# Install base packages
pacstrap /mnt base

# Generate fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# Change root into the new system
arch-chroot /mnt

# Set the hostname
echo "Enter a hostname for the system: "
read hostname
echo $hostname > /etc/hostname

# Set the timezone
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime

# Set the locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Set the root password
echo "Enter a password for the root user: "
read -s root_password
echo "root:$root_password" | chpasswd

# Create a new user
echo "Enter a username for the new user: "
read username
useradd -m -G wheel $username
echo "Enter a password for the new user: "
read -s user_password
echo "$username:$user_password" | chpasswd

# Install and configure sudo
pacman -S sudo
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# Install the Xfce desktop environment
pacman -S xfce4 xfce4-goodies
echo "exec startxfce4" > ~/.xinitrc

# Install Ulauncher as the launcher
pacman -S ulauncher

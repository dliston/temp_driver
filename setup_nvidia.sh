#!/bin/bash
# to run outside of xserver (CTL+ALT+F1)
# if a prompt fails to appear, add nomodeset to grub, update-grub

# /etc/default/grub
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset"
# update-grub

# dl 170722, updated to 384.59  works for 730 and 1060
# dl 200330, updated to 440.64
# dl 220125, updated to 470.94 which works for 730, 1030, and 1060

# https://wiki.debian.org/NvidiaGraphicsDrivers

NVIDIA_VERSION='470.94'
NVIDIA_DRIVER='NVIDIA-Linux-x86_64-'$NVIDIA_VERSION'.run'
URL='http://us.download.nvidia.com/XFree86/Linux-x86_64/'$NVIDIA_VERSION'/'$NVIDIA_DRIVER

KERNEL=$(uname -r)
KERNEL_PATH=$'/boot/config-'$KERNEL
echo $KERNEL_PATH

OS=$(lsb_release -si)
VER=$(lsb_release -sd)
CODENAME=$(lsb_release -sc)

if [ "$USER" != "root" ];then
    echo "user is" $USER
    echo "must run script as root, exiting"
    exit;
else

  # if [ cat /etc/apt/sources.list | grep $CODENAME-backports]
  #
  # else
  #   echo "deb http://deb.debian.org/debian bullseye-backports main contrib non-free" | tee -a /etc/apt/sources.list
  # fi

  # prerequisites
  apt update
  apt install linux-headers-amd64 linux-image-amd64
  #apt install -t $CODENAME-backports linux-image-amd64
  #apt install -t $CODENAME-backports nvidia-driver firmware-misc-nonfree

  apt install nvidia-driver firmware-misc-nonfree

fi

# xrandr --newmode "1920x1080_144.00"  451.72  1920 2080 2296 2672  1080 1081 1084 1174  -HSync +Vsync
# xrandr --newmode "1920x1080_120.00"  368.76  1920 2072 2288 2656  1080 1081 1084 1157  -HSync +Vsync

# xrandr --addmode DVI-D-0 "1920x1080_120.00"
# xrandr --addmode DVI-D-0 "1920x1080_144.00"

# xrandr --output DVI-D-0 --mode 1920x1080 --rate 120.00
# xrandr --output DVI-D-0 --mode 1920x1080 --rate 144.00

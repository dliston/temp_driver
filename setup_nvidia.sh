!/bin/bash
# must be run outside of xserver (CTL+ALT+F1)
# if a prompt fails to appear, add nomodeset to grub, update-grub

# /etc/default/grub
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset"
# update-grub

# dl 170722, updated to 384.59  works for 730 and 1060
# dl 200330, updated to 440.64
# dl 220125, updated to 470.94 which works for 730, 1030, and 1060

#https://www.linuxcapable.com/how-to-install-or-upgrade-nvidia-drivers-on-debian-11-bullseye/

NVIDIA_VERSION='470.94'
NVIDIA_DRIVER='NVIDIA-Linux-x86_64-'$NVIDIA_VERSION'.run'
URL='http://us.download.nvidia.com/XFree86/Linux-x86_64/'$NVIDIA_VERSION'/'$NVIDIA_DRIVER

echo $NVIDIA_VERSION
echo $NVIDIA_DRIVER
echo $URL

if [ -f $NVIDIA_DRIVER ];
then
   echo "$NVIDIA_DRIVER has already been downloaded."
 else
   wget $URL
   chmod +x $NVIDIA_DRIVER
fi

KERNEL=$(uname -r)
KERNEL_PATH=$'/boot/config-'$KERNEL
echo $KERNEL_PATH

service mdm stop
init 3
./$NVIDIA_DRIVER

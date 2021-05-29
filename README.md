# GPUPassthrough
My scripts and configuration for single GPU passthrough on Linux 5.12 using Manjaro KDE.

## HARDWARE:

- Ryzen 5 2600
- Asrock Fality Gaming ITX/ac AB350
- Gigabyte RTX 3060 TI
- Several drives

## Important BIOS settings:
- UEFI on, CSM/Legacy OFF
- IOMMU ON/Enable
- ACS Override or similar ON

## Installing:

Enable amd_iommu on /etc/default/grub
- GRUB_CMDLINE_LINUX_DEFAULT
sudo grub-mkconfig
Run "install.sh"
Merge /etc from this repo with /etc
Configure your VM on virt manager and passthrough the relevant devices.

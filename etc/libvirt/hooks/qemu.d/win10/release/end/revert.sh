set -x

# load variables
source "/etc/libvirt/hooks/kvm.conf"

# unload vfio
modprobe -r vfio
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1


# reattatch gpu
virsh nodedev-reattach $VIRSH_GPU_VIDEO
virsh nodedev-reattach $VIRSH_GPU_AUDIO

# rebind VTConsoles
echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 1 > /sys/class/vtconsole/vtcon1/bind

# read nvidia x config
nvidia-xconfig --query-gpu-info > /dev/null 2>&1

# bind EFI-framebuffer
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/bind

# load nvidia driver
modprobe nvidia_drm
modprobe nvidia_modeset
modprobe drm_kms_helper
modprobe nvidia
modprobe i2c_nvidia_gpu
modprobe drm
modprobe nvidia_uvm

# start display service
systemctl start sddm.service


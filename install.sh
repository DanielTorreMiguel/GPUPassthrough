echo "entering sudo"
sudo su

echo "Installing software"
pacman -S qemu libvirt edk2-ovmf virt-manager ebtables dnsmasq

echo "enabling services"
systemctl enable --now libvirtd.service
systemctl enable --now virtlogd.socket

echo "Configuring network"
virsh net-autostart default
virsh net-start default



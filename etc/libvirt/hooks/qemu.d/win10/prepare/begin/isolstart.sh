systemctl set-property --runtime -- user.slice AllowedCPUs=0,6
systemctl set-property --runtime -- system.slice AllowedCPUs=0,6
systemctl set-property --runtime -- init.scope AllowedCPUs=0,6

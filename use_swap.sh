dd if=/dev/zero of=/usr/swapfile bs=1M count=2048
mkswap /usr/swapfile
swapon /usr/swapfile

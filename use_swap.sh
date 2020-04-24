dd if=/dev/zero of=/usr/swapfile bs=1M count=1024
mkswap /usr/swapfile
swapon /usr/swapfile

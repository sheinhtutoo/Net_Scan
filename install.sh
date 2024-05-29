#!/bin/bash

sudo clear

cat << "EOF"


███╗   ██╗███████╗████████╗   ███████╗ ██████╗ █████╗ ███╗   ██╗
████╗  ██║██╔════╝╚══██╔══╝   ██╔════╝██╔════╝██╔══██╗████╗  ██║
██╔██╗ ██║█████╗     ██║█████╗███████╗██║     ███████║██╔██╗ ██║
██║╚██╗██║██╔══╝     ██║╚════╝╚════██║██║     ██╔══██║██║╚██╗██║
██║ ╚████║███████╗   ██║      ███████║╚██████╗██║  ██║██║ ╚████║
╚═╝  ╚═══╝╚══════╝   ╚═╝      ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝

(=======================[Shein Htut Oo]========================) 

EOF
check_arp_scan_installed() {
    if dpkg -l | grep -q arp-scan &> /dev/null; then
        return 0
    else
        return 1
    fi
}

check_internet_connection() {
    if ping -c 1 8.8.8.8 &> /dev/null; then
        return 0
    else
        return 1
    fi
}
echo "Checking internet connection...!"
sleep 3
if check_internet_connection; then
    echo "Net-Scan: Process in installation..." 
else
    echo "No Internet connection! Please try again."
    exit 1
fi
sleep 5

echo "Net-Scan: Installing python3..."
sudo apt install python3 -y >/dev/null 2>&1
sudo pip install lolcat >/dev/null 2>&1
echo "Net-Scan: Inalled python3 successful!"

echo "Net-Scan: Installing ARP Scan & Gawk..."
sudo apt install arp-scan gawk >/dev/null 2>&1
 if check_arp_scan_installed; then
    sudo chmod 644 /etc/arp-scan/mac-vendor.txt /usr/share/arp-scan/ieee-oui.txt
    echo "Net-Scan: Installed ARP-Scan & Gawk successful!"
else
    echo "Failed to install arp-scan. Exiting."
    echo "Net-Scan: Installation Unsuccessful..!"
    exit 1
fi

sudo chmod +x $(pwd)/net-scan.sh
sudo ln -s $(pwd)/net-scan.sh /usr/bin/netscan
sudo mkdir /usr/lib/Net-Scan
sudo cp $(pwd)/icon.png /usr/lib/Net-Scan/
sudo cp $(pwd)/net-scan.sh /usr/lib/Net-Scan/
sudo chmod +x net-scan.desktop
sudo cp net-scan.desktop /usr/share/applications/
sudo cp net-scan.desktop $HOME/Desktop/
sudo chmod u+x $HOME/Desktop/net-scan.desktop
echo "Checking Installation Process..."
sleep 3
echo "Net-Scan Installation Successful..!"

read -p "Do you want to run Net-Scan now? [Y/n]" run

if [ -z "$run" ]; then
    exit 1
fi

if [ "$run" = "Y" ] || [ "$run" = "y" ]; then
    netscan
fi

if [ "$run" = "N" ] || [ "$run" = "n" ]; then
    exit 1
fi


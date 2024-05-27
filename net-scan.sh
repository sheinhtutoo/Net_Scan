#!/bin/bash

sudo clear

cat << "EOF" | lolcat


    ███╗   ██╗███████╗████████╗   ███████╗ ██████╗ █████╗ ███╗   ██╗
    ████╗  ██║██╔════╝╚══██╔══╝   ██╔════╝██╔════╝██╔══██╗████╗  ██║
    ██╔██╗ ██║█████╗     ██║█████╗███████╗██║     ███████║██╔██╗ ██║
    ██║╚██╗██║██╔══╝     ██║╚════╝╚════██║██║     ██╔══██║██║╚██╗██║
    ██║ ╚████║███████╗   ██║      ███████║╚██████╗██║  ██║██║ ╚████║
    ╚═╝  ╚═══╝╚══════╝   ╚═╝      ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝

(===========================[Shein Htut Oo]============================) 

*************************************************************************
* Author        - Shein Htut Oo                                         *
* Tool          - Network Scanning Tool (active network reconnaissance) *    
* Modified date - Sun May 26 04:35:41 PM +0630 2024                     *
* Version       - 1.0 (Beta)                                            *
* GitHub        - https://github.com/sheinhtutoo                        *
* Facebook      - https://www.facebook.com/sheinhtutoo                  *
*************************************************************************

EOF

read -p "Input your network_interface:" inter

if [ -z "$inter" ]; then
    echo "Please input your netwokr_interface"
    exit 1
fi

echo "Start scanning..."| lolcat -a -d 50

sudo arp-scan --interface=$inter --localnet | sed 's| (https://github.com/royhills/arp-scan)||' | awk 'BEGIN {
    print "=============================================================================================="
    print "|IP Address                            MAC Address                       MAC Vendor/Hostname |"
    print "=============================================================================================="
}
{
    # Extract MAC Vendor name from the rest of the fields
    vendor_name = $3
    for (i = 4; i <= NF; i++) {
        vendor_name = vendor_name " " $i
    }
    if ($3 in vendor) {
        vendor_name = vendor[$3]
    }
}
!seen[$1]++{
    printf "%-36s %-35s %-40s\n", $1, $2, vendor_name
}'



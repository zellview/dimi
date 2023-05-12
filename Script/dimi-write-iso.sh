#! bin/bash

# MODULE DimiWriteIso;

# 8. Mai 2023
# source www.github.com/zellview/dimi
# copyright by zellview network

# CONST
    Modulename="DimiWriteIso"
    Version="3.1.15"

# VAR
    destDevice=$1

# BEGIN
    
    beg=$(date +"%H:%M:%S")
    echo "$Modulename start at $beg"
    
    if [ -z "$destDevice" ]; then
        echo "This script will write zv-dimi-$Version iso-image to USB-stick."
        echo
        lsblk
        echo
        echo "ATTENTION: All data on stick will be erased"
        read -p "Write through which device? /dev/" destDevice
        destDevice=/dev/$destDevice
    fi

    sudo time dd if=../../dimi-rsrc/iso/zv-dimi-$Version-ventoy.iso of=$destDevice bs=4M status=progress
    
    # finnish
    end=$(date +"%H:%M:%S")
    echo "$Modulename finnished"
    echo "start $beg"
    echo "end   $end"
    #echo "elapsed time ${ $end-$beg }"
    echo
    
# END DimiWriteIso.

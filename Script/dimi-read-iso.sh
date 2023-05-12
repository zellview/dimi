#! bin/bash

# MODULE DimiReadIso;

# zellview-dimi version 3.1.15 , 12. Mai 2023
# copyright by zellview network

# CONST
    Modulename="DimiReadIso"

# VAR
    sourceDevice=$1

# BEGIN

    # create iso-file from the two ventoy-partitions of the USB-stick
    # - to evaluate parameter count use fdisk to read the last sector of the last partition
    # - add 1 and divide by blocksize in kB, round up to next integer
    # - eg last sector: 11263999 +1 = 11264000/2048 =< 5500
    
    if [ -z "$sourceDevice" ]; then
        echo $Modulename
        echo "This script will create an iso-file from the first ~12G of the device."
        echo
        lsblk
        echo
        read -p "Create from which device? /dev/" sourceDevice
    fi

    beg=$(date +"%H:%M:%S")
    echo "$Modulename start at $beg"
    
    sudo dd if=/dev/$sourceDevice of=../../dimi-rsrc/iso/zv-dimi-3.1.15-ventoy.iso bs=1M count=10010 status=progress
    
    # finnish
    end=$(date +"%H:%M:%S")
    echo "$Modulename finnished"
    echo "start $beg"
    echo "end   $end"
    #echo "elapsed time ${ $end-$beg }"
    echo
    
# END DimiReadIso.

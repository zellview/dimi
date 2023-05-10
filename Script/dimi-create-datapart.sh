
#! bin/bash

# MODULE DimiCreateDatapart;

# zellview-dimi version 3.1.14 , 8. Mai 2023
# copyright by zellview network

# CONST
    Modulename="DimiCreateDatapart"

# BEGIN
    echo
    echo "This script will create a data partition"
    echo "at the end of the destination-device."
    echo
    echo "Choose the appropriate device to create the partition."
    echo
    lsblk
    echo
    read -p "Create partition on which device? /dev/" destDevice
    destDevice=/dev/$destDevice

    echo "Create partition on device"
    echo "************"
    echo $destDevice
    echo "************"
    echo
    echo "Press RETURN to continue or CTRL+C to abort."
    read tmp
    
    beg=$(date +"%H:%M:%S")
    echo "$Modulename start at $beg"

    # create datapartition at the end of disk
    
    #TODO
    echo "create primary partition ext4 $destDevice 10.5 GB to 100%"
    sudo parted $destDevice mkpart primary ext4 10.5GB 100%
    
#    echo "delete partition ${destDevice}3"
#    sudo parted rm ${destDevice}3

    echo "make filesystem ext4 on ${destDevice}3"
    sudo mkfs.ext4 ${destDevice}3

    echo "label partition ${destDevice}3"
    sudo e2label ${destDevice}3 "zv-data"
        
    # finnish
    end=$(date +"%H:%M:%S")
    echo "$Modulename finnished"
    echo "start $beg"
    echo "end   $end"
    #echo "elapsed time ${ $end-$beg }"
    echo
    
# END DimiCreateDatapart.

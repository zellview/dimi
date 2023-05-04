#! bin/bash

# MODULE DimiCreateDatapart;

# zellview-dimi version 3.1.10 , 4. Mai 2023
# copyright by zellview network

# CONST
    Modulename="DimiCreateDatapart"

# VAR
    sourceDevice=$1

# BEGIN

    beg=$(date +"%H:%M:%S")

    # create datapartition at the end of disk
    
    #TODO
    sudo parted /dev/sdb mkpart primary ext4 10.5GB 100%
    sudo mkfs.ext4 /dev/sdb3
    sudo e2label /dev/sdb3 "zv-data"
    
    
    # finnish
    end=$(date +"%H:%M:%S")
    echo "$Modulename finnished"
    echo "start $beg"
    echo "end   $end"
    #echo "elapsed time ${ $end-$beg }"
    echo
    
# END DimiCreateDatapart.

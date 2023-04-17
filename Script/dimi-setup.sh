# MODULE DimiSetup"

# CONST
    Modulname="DimiSetup"

# BEGIN
    echo "***********************************************"
    echo $Modulname
    echo "zellview v3.1.05   17.April 2023"
    echo "copyright by zellview network"
    echo "www.zellview.net"
    echo
    echo "This script will install a basic"
    echo "software-set for zellview-dimi."
    echo 
    echo "anydesk blackbox2 git kazam kate "
    echo "retext snap wine xfburn zoom"
    echo
    echo "feedback is welcome   zellview@posteo.de"
    echo
    echo "visit us at GitHub http://zellview.network"
    echo
    echo "or sponsor our work via http://donate.zellview.network"
    echo
    echo "Press RETURN to continue or CTRL+C to abort."
    read tmp

    beg=$(date +"%H:%M:%S")
    echo "$Modulname started at $beg"
    echo

    echo "apt update"
    sudo apt update -y
    echo

    echo "install anydesk"
    sudo sh .install-anydesk.sh
    echo

    echo "install blackbox2"
    sudo sh .install-blackbox2.sh
    echo

    echo "install git"
    sudo apt install git -y
    echo

    echo "install kate"
    sudo apt install kate -y
    echo

    echo "install kazam"
    sudo apt install kazam -y
    echo

    echo "install retext"
    sudo apt install retext -y
    echo

#    echo "install snap"
#    sudo apt install snapd
#    echo
    
    echo "install wine"
    sudo sh .install-wine.sh

    echo "install xfburn"
    sudo apt install xfburn -y
    echo
    
#   echo "install zoom"
#   sudo snap install zoom-client
#   echo 

    end=$(date +"%H:%M:%S")
    echo
    echo "$Modulname started at $beg"
    echo "end at $end"
    #echo "elapsed time $end-$beg"
    echo

# END DimiSetup.

echo "install succesfully finnished"
echo "enjoy and happy coding"
echo
echo "feedback welcome at   zellview@posteo.de"
echo
echo "visit us at GitHub https://zellview.network"
echo
echo "or sponsor zellview https://sponsor.zellview.network"
echo
echo "keep the spirit of Pascal"
echo "cu"
echo "the zellview-team"
echo




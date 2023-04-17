# MODULE InstallBlackbox2

# (c) by zellview network, 5.August 2022

# BEGIN

    echo
    echo "install blackbox2 from oberon.org"
    beg=$(date +"%H:%M+%S")
    echo "BEGIN at $beg"
    echo

    echo "get key"
    wget http://deb.oberon.org/deb.oberon.org.gpg.key

    echo "add key"
    sudo apt-key add deb.oberon.org.gpg.key
    echo "add i386 architecture"
    sudo dpkg --add-architecture i386

    echo "add source to apt/sources"
    echo "deb http://deb.oberon.org/linux testing main" | sudo tee -a /etc/apt/sources.list

    sudo apt-get update -y
    sudo apt-get install bbcb2 -y

    end=$(date +"%H:%M+%S")
    echo "script started at $beg"
    echo "END InstallBlackbox2. at $end"
    # elap=$($beg-$end)
    # echo "elapsed time $elap"
    echo

# END InstallBlackbox2.


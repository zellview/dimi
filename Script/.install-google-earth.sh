# MODULE InstallGoogleEarth

# copyright by zellview network, 18.April 2023

# BEGIN

    echo
    echo "install google-earth-pro"
    beg=$(date +"%H:%M:%S")
    echo "BEGIN at $beg"
    echo

    echo -n "get debian install package ... "
    wget -O ~/google-earth.deb https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb
    echo "done"

    echo -n "install package ... "
    sudo dpkg -i ~/google-earth.deb
    echo "done"

    end=$(date +"%H:%M:%S")
    echo "script started at $beg"
    echo "InstallGoogleEarth ended $end"
    # elap=$($beg-$end)
    # echo "elapsed time $elap"
    echo

# END InstallGoogleEarth.


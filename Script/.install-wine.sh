# MODULE InstallWine"
# BEGIN

beg=$(date +"%H:%M:%S")
echo "InstallWine started $beg"

#Wine
sudo dpkg --add-architecture i386 

sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources

sudo apt update -y
sudo apt install --install-recommends winehq-stable -y

end=$(date +"%H:%M:%S")
echo "InstallWine started at $beg"
echo "ended at $end"
echo

# END InstallWine.


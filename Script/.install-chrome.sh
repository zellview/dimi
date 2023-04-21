# MODULE InstallChrome

echo
echo "install chrome"

beg=$(date +"%H%:M%:%S")
echo "BEGIN (* at $beg *)"

# get chrom package
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add

echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

# apt update
sudo apt update -y
# install chrome
sudo apt install -y google-chrome-stable

end=$(date +"%H%:M%:%S")
echo "script started at $beg"
echo "END InstallChrome. at $end"
# elap=$($beg-$end)
# echo "elapsed time $elap"
echo

# END InstallChrome.

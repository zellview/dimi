# MODULE InstallVirtualbox"
echo
echo "install virtualbox"
beg=$(date)
echo "BEGIN (* at $beg *)"

sudo apt update -y
sudo apt install virtualbox -y

end=$(date)
echo "END InstallVirtualbox. (* at $end *)"
elap=$($beg-$end)
echo "elapsed time $elap"
echo


# MODULE InstallAnydesk;" #

echo
echo "install anydesk"
beg=$(date  "%H:%M:%s")
echo "BEGIN at $beg"

# sudo apt update

curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/anydesk.gpg

echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list

sudo apt update
sudo apt install anydesk -y

end=$(date + "%H:%M:%s")
echo "script started at $beg"
echo "END InstallAnydesk. at $end"
#elap=$($beg-$end)
#echo "elapsed time $elap"

# END InstallDesk. #

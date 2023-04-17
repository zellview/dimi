# MODULE SquashInit;

# CONST ModuleName*="SquashInit";

# VAR
	zDev="zDev"
	distri="linuxmint-21-cinnamon-64bit.iso"
	destDir="zv-livecd"
	
	mountPoint="mnt"
	extPoint="extracted"
	editPoint="edit"

# BEGIN

	echo "1. Install the required software"
	sudo aptitude install squashfs-tools genisoimage

	echo "2. Prepare the temporary system"
	
	echo "make dir $destDir"
	mkdir ~/$destDir
	
	echo "copy $distri to $destDir"
	cp -v --no-clobber ~/$zDev/iso/$distri ~/$destDir
	
	echo "change dir to $destDir"
	cd ~/$destDir
	
	echo "make dir mountPoint $mountPoint"
	mkdir $mountPoint

	echo "mount $distri as loop on $mountPoint"
	sudo mount -o loop $distri $mountPoint
	
	echo "make dir $extPoint"
	mkdir $extPoint

	echo "rsync $mountPoint $extPoint"
	sudo rsync --exclude=/casper/filesystem.squashfs -a $mountPoint/ $extPoint

	echo "unsquash $mountPoint"
	sudo unsquashfs $mountPoint/casper/filesystem.squashfs

	echo "move squash-root to $editPoint"
	sudo mv squashfs-root $editPoint

	echo "3. Prepare network connection"

	sudo cp /etc/resolv.conf $editPoint/etc/
	sudo cp /etc/hosts $editPoint/etc/
	
	echo "4. Prepare a chroot environment"
	
	xhost +
	
	echo "mount /dev/ $editPoint/dev"
	sudo mount --bind /dev/ $editPoint/dev
	
	echo "chroot $editPoint"
	sudo chroot $editPoint
	
	echo "mount  proc to /proc"
	mount -t proc none /proc
	
	echo "mount sysfs none /sys"
	mount -t sysfs none /sys
	
	echo "mount devPoints /dev/pts"
	mount -t devpts none /dev/pts
	
	export HOME=/root
	export LC_ALL=C	
	
	echo "5. Preparing customization"	
	
	dbus-uuidgen > /var/lib/dbus/machine-id
	dpkg-divert --local --rename --add /sbin/initctl
	ln -s /bin/true /sbin/initctl

	echo "6.1 Installing software"

	echo "apt update"
	apt update
	
# END SquashInit.

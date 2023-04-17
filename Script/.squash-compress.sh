# MODULE SquashCompress;

# CONST ModuleName*="SquashCompress"

# VAR
	zDev="zDev"
	distri="linuxmint-21-cinnamon-64bit.iso"
	destDir="zv-livecd"
	
	mountPoint="mnt"
	extPoint="extracted"
	editPoint="edit"
	
	customIso="zellview-dimi.iso"

# BEGIN
	echo "8. Regenerate manifest"

	su
	chmod +w $extPoint/casper/filesystem.manifest
	chroot $editPoint dpkg-query -W --showformat='${Package} ${Version}\n' > $extPoint/casper/filesystem.manifest
	cp $extPoint/casper/filesystem.manifest $extPoint/casper/filesystem.manifest-desktop
	
	sed -i '/ubiquity/d' $extPoint/casper/filesystem.manifest-desktop
	sed -i '/casper/d' $extPoint/casper/filesystem.manifest-desktop
		
	echo "9. Compress"
	
	rm $extPoint/casper/filesystem.squashfs
	mksquashfs $extPoint $extPoint/casper/filesystem.squashfs -comp xz
	
	echo "10 .Update some required files"
	
	printf $(sudo du -sx --block-size=1 edit | cut -f1) > $extPoint/casper/filesystem.size

    echo "open extracted/README.diskdefines file with a text editor and change the name of the disk."
    #read tmp
	
	echo "remove MD5SUMS"
	cd $extPoint
	rm MD5SUMS
	
	echo "generate new MD5SUMS"
	find -type f -print0 | sudo xargs -0 md5sum | grep -v isolinux/boot.cat | sudo tee MD5SUMS
	
	echo "11. Create the ISO image"
	
	mkisofs -D -r -V "$IMAGE_NAME" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../$customIso .
	
	exit
	
	sudo chmod 777 ~/$destDir/customIso
	
# END SquashCompress;

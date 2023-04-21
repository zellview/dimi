# MODULE SquashFinnish;

# CONST ModuleName="SquashFinnish"

# VAR
	editPoint="edit"

# BEGIN
	echo "... 6.4 make sure source-application is up to date"

	apt install ubiquity-frontend-gtk
		
	echo "7. Cleanup your new system"
	
	aptitude clean
	
	rm -r /var/cache/apt/archives/*
	rm -r /mydir
	rm -rf /tmp/* ~/.bash_history
	rm /var/lib/dbus/machine-id
	rm /sbin/initctl
	dpkg-divert --rename --remove /sbin/initctl
	
	umount /proc || umount -lf /proc
	umount /sys
	umount /dev/pts
	
	exit
	sudo umount $editPoint/dev
	xhost -
	
# END SquashFinnish;

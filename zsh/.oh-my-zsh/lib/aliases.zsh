# Basic directory operations

alias ...='cd ../..'
alias -- -='cd -'

function uusb() {
	cd
	DEVs="`dmesg | grep "sd.: sd" | tail -n 1 | sed -e 's/.*sd.: //g' | sed -e 's/ <.*//g'`"
	C=1
	for i in $DEVs; do
		if [ -d $HOME/usb$C ]; then
			sudo umount $HOME/usb$C && rmdir  $HOME/usb$C
		else
			sudo umount /dev/$DEVs
		fi

		C=$(( C + 1 ))
	done
}

function musb() {
	DEVs="`dmesg | grep "sd.: sd" | tail -n 1 | sed -e 's/.*sd.: //g' | sed -e 's/ <.*//g'`"
	C=1
	for i in $DEVs; do
		DEV="/dev/$i"
		mkdir -p $HOME/usb$C
		echo mount $DEV $HOME/usb$C ...
		sudo mount $DEV $HOME/usb$C
		C=$(( C + 1 ))
	done
}

function lusb() {
	USB="`dmesg | grep "sd.: sd" | tail -n 1 | sed -e 's/.*sd.: //g'`"
	echo $USB
}

function eejava6() {
	echo "export java6 to PATH"
	JAVA_HOME=/usr/lib/jvm/java-6-oracle
	PATH=$JAVA_HOME/jre/bin:$JAVA_HOME/bin:$JAVA_HOME/db/bin:$PATH
	echo "eejava6 done"
}

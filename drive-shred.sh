#!/bin/bash

echo "Welcome to my simple shredder"
echo "Which device do you want to delete? (/dev/...)"
read device


#Security question if someone want's to delte the first device
if [ $device = "sda" ]
	then
		echo "WARNING! You are going to delete the first drive: " $device
		echo "Press Return to succeed"
		read spaceholder
fi

echo "Str + C to exit or 'y' to shred"
read EXIT


#Loop to always delete the $device
while [ $EXIT = "y" ]
	do
		sudo shred -n 1 -v /dev/$device
		echo "Shred complete"
sudo fdisk /dev/$device<<EOF
o

w
EOF

		echo
		echo
		echo "Empty partition table created!"
		echo
		echo "Press Crtl + C to EXIT"
		echo "'y' to shred" $platte "again"
		echo "'e' to change" $platte "to another device"

		read EXIT

#If to restart the program
if [ $EXIT = "e" ]
	then
		sudo bash $dirname $0
fi

done


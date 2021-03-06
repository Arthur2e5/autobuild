#!/bin/bash
# user/group utils from ab3

# user LOGIN UID GID HOME COMMENT SHELL [GROUPS..]
user(){
	echo "grep -q '^$1:' /etc/passwd || useradd $(dumparg -u "$2" -g "$3" -d "$4"  -c "$5" -s "$6" "$1" -m)" >> abscripts/preinst
	N=$1
	shift 6
	for i; do echo "usermod -a -G '$i' '$N'" >> abscripts/preinst; done
}

# group NAME GID
group(){
	echo "grep -q '^$1:' /etc/passwd || groupadd $(dumparg -g "$2" "$1")" >> abscripts/preinst
}
if [ -e autobuild/usergroup ]
then
	. autobuild/usergroup
fi

unset user group


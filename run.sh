#!/bin/bash
if [ ! -f /.root_pw_set ]; then
	/set_root_pw.sh && /superupdate.sh
fi
exec /usr/sbin/sshd -D
#/bin/bash

echo $USER
/usr/sbin/usermod -aG sudo $USER
echo "Please relog now"

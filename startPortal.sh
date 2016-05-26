#!/bin/bash
echo "Starting WebSphere Portal ........."
#    # Update the hostname
#    /opt/IBM/WebSphere/AppServer/bin/wsadmin.sh -lang jython -conntype NONE -f /work/updateHostName.py \
#    $NODE_NAME $host

#    touch /work/hostnameupdated

#fi

#if [ "$PROFILE_NAME" = "" ]
#then
#    PROFILE_NAME="Dmgr01"
#fi

/opt/IBM/WebSphere/wp_profile/bin/startServer.sh WebSphere_Portal

sleep 30

while [ -f "/opt/IBM/WebSphere/wp_profile/logs/WebSphere_Portal/WebSphere_Portal.pid" ]
do
    sleep 5
done

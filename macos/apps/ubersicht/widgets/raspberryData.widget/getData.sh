#!/bin/sh

# Configuration
username='pi'
hostname='rbp.alejakun.io'

# List of commands
CoreTemp="vcgencmd measure_temp | tr -d \"temp=\" | tr -d \"'C\""

osReleaseName="cat /etc/os-release | grep \"PRETTY_NAME\" | awk -F\"=\" '{print \$2}' | sed 's/\"//g'"
DeviceModel="cat /sys/firmware/devicetree/base/model"
placeholder="echo" #because after previous command there is no line break which is needed in widget to split the script ouput
uptime="uptime -p"

freeRAM="free -m -t | grep 'Mem' | awk '{print \$3}'"
totalRAM="free -m -t | grep 'Mem' | awk '{print \$2}'"

ipAddress="hostname -I | awk '{print \$1}'"                                                   # 192.168.0.210
kernelVersion="uname -r"                                                                      # 5.10.103-v8+

diskSpace="df -hP | grep root | tr -s \" \" | sed 's/G//g' | sed 's/%//g'"

runningsProcs="/bin/ls -d /proc/[0-9]* | wc -l"                                               # 590
cpuType="cat /proc/cpuinfo | grep \"Hardware\" | awk -F\":\" '{print \$2}' | tr -d \" \""     # BCM2835
cpuRevision="cat /proc/cpuinfo | grep \"Revision\" | awk -F\":\" '{print \$2}' | tr -d \" \"" # d03114
cpuModel="cat /proc/cpuinfo | grep \"Model\" | awk -F\":\" '{print \$2}'"

# Check if host avalaibale
if ping -c1 $hostname 1>/dev/null 2>/dev/null
then

  # Check if ssh connection can be established with given user
  if ssh $username@$hostname "true"
  then
    # Send all the commands at once
    ssh $username@$hostname "
    $CoreTemp;
    $osReleaseName;
    $DeviceModel;
    $placeholder;
    $uptime;
    $freeRAM;
    $totalRAM;
    $ipAddress;
    $kernelVersion;
    $diskSpace;
    $runningsProcs;
    $cpuType;
    $cpuRevision;
    $cpuModel
    "
  else
    echo "no ssh"
    echo $username
    echo $hostname
  fi
else
  echo "host not found"
  echo $hostname
fi

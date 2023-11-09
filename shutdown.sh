#!/bin/bash

echo "Routine Shutdown Requested"
batt=`(/home/ubuntu/HumbleDave/plib/battery.py)`
/home/ubuntu/HumbleDave/logMaintenance.py "Routine Shutdown"
/home/ubuntu/HumbleDave/logMaintenance.py "'$batt'"
sudo shutdown -h +2

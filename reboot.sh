#!/bin/bash

echo "Routine Reboot Requested"
batt=`(/home/ubuntu/HumbleDave/plib/battery.py)`
/home/ubuntu/HumbleDave/logMaintenance.py "Routine Reboot"
/home/ubuntu/HumbleDave/logMaintenance.py "'$batt'"
sudo reboot

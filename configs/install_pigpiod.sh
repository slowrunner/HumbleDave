#!/bin/bash

sudo systemctl stop pigpiod.service
sudo cp /home/ubuntu/HumbleDave/configs/pigpiod.service /etc/systemd/system
sudo systemctl enable pigpiod.service
sudo systemctl start pigpiod.service
systemctl status pigpiod.service

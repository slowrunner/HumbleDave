#!/bin/bash

echo -e "\n*** ZOMBIE PROCESSES ***"
ps aux | awk '$8 ~ /^[Zz]/'
echo -e "\nZombie Process Parents"
ps -A -ostat,pid,ppid | grep -e '[zZ]'
echo -e "\nKill Zombies with 'kill -9 <parent_PID>'"


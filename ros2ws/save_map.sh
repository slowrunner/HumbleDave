#!/bin/bash

echo -e "\n*** SAVING MAP TO xyzzy.map"
echo '*** ros2 run nav2_map_server map_saver_cli -f "xyzzy.map" '
ros2 run nav2_map_server map_saver_cli -f "xyzzy.map"
echo -e "\n*** WAITING 10s FOR MAP SAVER"
sleep 10
# echo -e "\n*** NOW RUN export_jpg_map.sh ***"
echo -e "\n*** Exporting xyzzy.map.pgm to jpg format: xyzzy.map.jpg"
echo "***  mogrify -format jpg xyzzy.map.pgm"
mogrify -format jpg xyzzy.map.pgm
echo "*** xyzzy.map.jpg created"

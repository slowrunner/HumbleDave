#!/usr/bin/env  python3

import sys
sys.path.insert(1,"/home/ubuntu/HumbleDave/plib")

import rosbotDataJson

# print("carlDataJson contents:")
# lcarlData = carlDataJson.getCarlData()
# for i in lcarlData:
#     print("  ",i," : ",lcarlData[i])

rosbotDataJson.printData()

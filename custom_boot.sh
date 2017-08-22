#!/bin/bash
# Copyright (C) 2016 - 2017 Tuxafgmur - Dhollmen 
# Modifies boot before build the image
# Parameters: 
#   1 = $(TARGET_DEVICE_DIR)
#   2 = $(TARGET_ROOT_OUT)

mkdir -p $2/cache
mkdir -p $2/efs

rm -f $2/charger
rm -f $2/init.trace.rc
rm -f $2/init.usb.configfs.rc

#cp $PWD/$1/rootdir/etc/init.usb.rc $2/
#cp $PWD/$1/rootdir/etc/ueventd.rc  $2/

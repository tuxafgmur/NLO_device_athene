#!/bin/bash
# Copyright (C) 2016 - 2017 Tuxafgmur - Dhollmen 
# Modify boot before build image

FN_tempfile () {
    sed 's/\x09/ /g' -i /tmp/$1
    sed  '/^#/d' -i /tmp/$1
    sed  '/^$/d' -i /tmp/$1
    sed 's/  */ /g' -i /tmp/$1
    column -t /tmp/$1 > /tmp/filetmp
    rm /tmp/$1
}

mkdir -p $2/cache
mkdir -p $2/efs

rm -f $2/charger
rm -f $2/init.trace.rc
rm -f $2/init.usb.configfs.rc

cp $PWD/$1/rootdir/etc/init.usb.rc $2/
cp $PWD/$1/rootdir/etc/ueventd.rc  $2/

cp $2/file_contexts /tmp
FN_tempfile file_contexts
sed 's/    --  */--  /g' -i /tmp/filetmp
LC_ALL=C sort /tmp/filetmp > $2/file_contexts

cp $2/property_contexts /tmp
FN_tempfile property_contexts
sort /tmp/filetmp > $2/property_contexts

cp $2/service_contexts /tmp
FN_tempfile service_contexts
sort /tmp/filetmp > $2/service_contexts

rm   /tmp/filetmp

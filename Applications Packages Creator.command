#!/bin/bash
# Applications Packages Creator
# Copyright (c) 2017,chris1111<leblond1111@gmail.com>

#get APP Installer path
if [ "$2" == "" ]; then
echo "Please launch your app from your Applications in the terminal window "
echo "Follow by ENTER: "
echo " "
while [ -z "$APP" ]; do
read APP
done

else
APP="$2"
fi

touch /tmp/PackageInfo
Sleep 2
echo '<?xml version="1.0" encoding="utf-8" standalone="no"?>
<installer-gui-script minSpecVersion="1">
    <title>MyPackage.pkg</title>
    <pkg-ref id="com.Application.customize"/>
    <options customize="never" allow-external-scripts="true"/>
    <domains enable_anywhere="true"/>
    <choices-outline>
        <line choice="default">
            <line choice="com.Application.customize"/>
        </line>
    </choices-outline>
    <choice id="default"/>
    <choice id="com.Application.customize" visible="false">
        <pkg-ref id="com.Application.customize"/>
    </choice>
    <pkg-ref id="com.Application.customize" version="1" onConclusion="none">MyPackage.pkg</pkg-ref>
</installer-gui-script>' >/tmp/PackageInfo

pkgbuild --info /tmp/PackageInfo --component "$APP" $HOME/Desktop/MyPackage.pkg
rm -rf /tmp/PackageInfo
echo " "
echo "MyPackage.pkg ➤ /Desktop/MyPackage.pkg "
echo " "
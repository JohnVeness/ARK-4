#!/usr/bin/env bash

# ArkFast updater script by Yoti for ARK-4 project
# 2022-09-06: initial release
# 2022-09-06: fix kexploit -1

#sudo apt update
#sudo apt install zip unzip -y

if [ -f "ArkFast.vpk" ]; then
    rm -f ArkFast.vpk
fi
wget -q --show-progress "https://github.com/ONElua/ArkFast/releases/latest/download/ArkFast.vpk"
if [ -f "ArkFast.vpk" ]; then
    unzip ArkFast.vpk -d ArkFast_tmp
    rm -f ArkFast.vpk
else
    echo "Can't found ArkFast.vpk"
    exit
fi

if [ -f "ARK4.zip" ]; then
    rm -f ARK4.zip
fi
wget -q --show-progress "https://github.com/PSP-Archive/ARK-4/releases/latest/download/ARK4.zip"
if [ -f "ARK4.zip" ]; then
    unzip ARK4.zip -d ARK4_tmp
    rm -f ARK4.zip
else
    echo "Can't found ARK4.zip"
    exit
fi

if [ -f "ArkFast_new.vpk" ]; then
    rm -f ArkFast_new.vpk
fi
cd ARK4_tmp/
mv -f VitaBubble/K.BIN ARK_01234/K.BIN
zip -r ARK_01234.zip ARK_01234
mv -f ARK_01234.zip ../ArkFast_tmp/resources/ARK_01234.zip
cd ..
rm -rf ARK4_tmp/
cd ArkFast_tmp/
zip -r ../ArkFast_new.vpk .
cd ..
rm -rf ArkFast_tmp/

echo "Done!"

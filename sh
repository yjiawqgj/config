#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions
sed -i 's/192.168.1.1/10.10.10.15/g' package/base-files/files/bin/config_generate
rm -rf ./package/lean/default-settings/files/zzz-default-settings
curl -fsSL  https://raw.githubusercontent.com/yjiawqgj/config/main/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
rm -rf ./package/lean/autocore/files/x86/autocore
curl -fsSL  https://raw.githubusercontent.com/yjiawqgj/config/main/autocore > ./package/lean/autocore/files/x86/autocore
rm -rf ./package/lean/autocore/files/x86/index.htm
curl -fsSL https://raw.githubusercontent.com/yjiawqgj/config/main/x86.htm > package/lean/autocore/files/x86/index.htm
rm -rf ./package/lean/autocore/files/arm/index.htm
curl -fsSL https://raw.githubusercontent.com/yjiawqgj/config/main/arm.htm > package/lean/autocore/files/arm/index.htm
git clone -b master https://github.com/vernesong/OpenClash.git package/OpenClash
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
git clone -b master --single-branch https://github.com/yjiawqgj/OpenAppFilter ./package/diy/OpenAppFilter
./scripts/feeds update -i

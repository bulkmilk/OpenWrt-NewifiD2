#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
# sed -i 's/192.168.1.1/192.168.10.254/g' package/base-files/files/bin/config_generate

# DHCP Setting
sed -i 's/100/101/g' package/network/services/dnsmasq/files/dhcp.conf
sed -i 's/150/100/g' package/network/services/dnsmasq/files/dhcp.conf
sed -i 's/12h/24h/g' package/network/services/dnsmasq/files/dhcp.conf

# 修改默认主题为luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

#
sed -i "2i uci set network.lan.ipaddr='192.168.10.254'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.netmask='255.255.255.0'" package/lean/default-settings/files/zzz-default-settings    
sed -i "4i uci set network.lan.gateway='192.168.10.254'" package/lean/default-settings/files/zzz-default-settings
sed -i "5i uci set network.lan.gateway='192.168.10.254'" package/lean/default-settings/files/zzz-default-settings
sed -i "6i uci set network.lan.delegate='0'" package/lean/default-settings/files/zzz-default-settings
sed -i "7i uci commit network\n" package/lean/default-settings/files/zzz-default-settings

# 安装最新luci-theme-argon主题
# https://github.com/jerrykuku/luci-theme-argon
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

# 安装最新京东签到插件
# https://github.com/jerrykuku/luci-app-jd-dailybonus
rm -rf package/lean/luci-app-jd-dailybonus
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/lean/luci-app-jd-dailybonus


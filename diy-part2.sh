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

sed -i 's/100/101/g' package/network/services/dnsmasq/files/dhcp.conf
sed -i 's/150/100/g' package/network/services/dnsmasq/files/dhcp.conf
sed -i 's/12h/24h/g' package/network/services/dnsmasq/files/dhcp.conf

sed -i "2i uci set network.lan.ipaddr='192.168.10.254'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.netmask='255.255.255.0'" package/lean/default-settings/files/zzz-default-settings    
sed -i "4i uci set network.lan.gateway='192.168.10.254'" package/lean/default-settings/files/zzz-default-settings
sed -i "5i uci set network.lan.dns='119.29.29.29 182.254.116.116'" package/lean/default-settings/files/zzz-default-settings
sed -i "6i uci commit network\n" package/lean/default-settings/files/zzz-default-settings

# Install Argon Theme
# https://github.com/jerrykuku/luci-theme-argon
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

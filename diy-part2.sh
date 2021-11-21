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
sed -i 's/192.168.1.1/192.168.10.254/g' package/base-files/files/bin/config_generate

# start 	100
# limit	150
# sed -i 's/100/101/g' package/network/services/dnsmasq/files/dhcp.conf
# sed -i 's/150/100/g' package/network/services/dnsmasq/files/dhcp.conf

# sed -i 's/start 	100/start 	101/g' package/network/services/dnsmasq/files/dhcp.conf
# sed -i 's/limit	150/limit	100/g' package/network/services/dnsmasq/files/dhcp.conf

# sed -i '/exit 0/d' package/lean/default-settings/files/zzz-default-settings

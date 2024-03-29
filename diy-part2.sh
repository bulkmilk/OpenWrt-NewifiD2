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

#
sed -i "3i uci commit network\n" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.delegate='0'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.dns='119.29.29.29 182.254.116.116'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.gateway='192.168.10.254'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.netmask='255.255.255.0'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.ipaddr='192.168.10.254'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.wan.delegate='0'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.wan.proto='pppoe'" package/lean/default-settings/files/zzz-default-settings

sed -i "3i uci commit dhcp\n" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set dhcp.lan.leasetime='12h'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set dhcp.lan.limit='50'" package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set dhcp.lan.start='101'" package/lean/default-settings/files/zzz-default-settings

# 删除默认密码
# sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

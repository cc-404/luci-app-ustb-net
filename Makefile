
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-ustb-net
PKG_VERSION:=v0.1
PKG_RELEASE:=1

PKG_LICENSE:=MIT

LUCI_TITLE:=LuCI support for USTB network login and logout
LUCI_DEPENDS:=+wget
LUCI_PKGARCH:=all

PKG_MAINTAINER:=<https://github.com/iz4iz4/luci-app-ustb-net>

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature


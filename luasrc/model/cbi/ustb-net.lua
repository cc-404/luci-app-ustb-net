m = Map("ustb-net", "北科校园网登录助手")
m.description = translate("原理：使用wget进行发送登录或者注销请求从而实现登录或者注销<br />具体使用方法可查看github：<br />https://github.com/iz4iz4/luci-app-ustb-net")

m:section(SimpleSection).template  = "ustb-net/ustb_status"

s = m:section(TypedSection, "ustb-net")
s.addremove = false
s.anonymous = true

enabled = s:option(Flag, "autologin", translate("自动登录"))
enabled.default = 0
enabled.rmempty = false
enabled.description = translate("勾选后可随路由器启动而自动登录")

host = s:option(ListValue, "host", translate("登录验证IP"))
host:value("202.204.48.82", translate("202.204.48.82\(默认\)"))
host:value("202.204.48.66", translate("202.204.48.66"))

user = s:option(Value, "username", translate("Username"))
user.rmempty = false
pass = s:option(Value, "password", translate("Password"))
pass.password = true
pass.rmempty = false
v6adrr = s:option(Value, "ipv6addr", translate("IPv6Address"))
v6adrr.description = translate("Ipv6 地址可以省略")
ustb_login = s:option(Button, "login_button", translate("Login"))
ustb_login.inputtitle = translate("Login")
ustb_login.inputstyle = "apply"
function ustb_login.write(self, section)
	io.popen("/usr/bin/ustb-login > /dev/null")
end

ustb_logout = s:option(Button, "logout_button", translate("Logout"))
ustb_logout.inputtitle = translate("Logout")
ustb_logout.inputstyle = "apply"
function ustb_logout.write(self, section)
	io.popen("/usr/bin/ustb-logout > /dev/null")
end

return m

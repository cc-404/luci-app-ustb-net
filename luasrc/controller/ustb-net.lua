
module("luci.controller.ustb-net", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/ustb-net") then
		return
	end

	entry({"admin", "services", "ustb-net"},firstchild(), _("北科校园网助手"), 50).dependent = false
	
	entry({"admin", "services", "ustb-net", "general"},cbi("ustb-net"), _("设置"), 1)

	entry({"admin","services","ustb-net","status"},call("act_status")).leaf=true

end

function act_status()
	local e={}
	e.running=luci.sys.call("ping6 -c 1 ipv6.ip.sb > /dev/null")==0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end


m = Map("sfe")
m.title	= translate("Turbo ACC Acceleration Settings")
m.description = translate("Opensource Qualcomm Shortcut FE driver (Fast Path)")

m:append(Template("sfe/status"))

s = m:section(TypedSection, "sfe", "")
s.addremove = false
s.anonymous = true


enable = s:option(Flag, "enabled", translate("Enable SFE Fast Path"))
enable.default = 0
enable.rmempty = false
enable.description = translate("Enable Fast Path offloading for connections. (decrease cpu load / increase routing throughput)")

wifi = s:option(Flag, "wifi", translate("Bridge Acceleration"))
wifi.default = 0
wifi.rmempty = false
wifi.description = translate("Enable Bridge Acceleration (may be functional conflict with bridge-mode VPN Server)")
wifi:depends("enabled", 1)

ipv6 = s:option(Flag, "ipv6", translate("IPv6 Acceleration"))
ipv6.default = 0
ipv6.rmempty = false
ipv6.description = translate("Enable IPv6 Acceleration")
ipv6:depends("enabled", 1)

bbr = s:option(Flag, "bbr", translate("Enable BBR"))
bbr.default = 0
bbr.rmempty = false
bbr.description = translate("Bottleneck Bandwidth and Round-trip propagation time (BBR)")

dns = s:option(Flag, "dns", translate("DNS Acceleration"))
dns.default = 0
dns.rmempty = false
dns.description = translate("Enable DNS Cache Acceleration and anti ISP DNS pollution")

o = s:option(Value, "dns_server", translate("Upsteam DNS Server"))
o.default = "1.0.0.1,1.1.1.1,1.2.4.8,4.2.2.1,4.2.2.2,8.8.4.4,8.8.8.8,9.9.9.9,114.114.114.114,114.114.115.115,119.28.28.28,119.29.29.29,180.76.76.76,210.2.4.8,208.67.220.220,208.67.222.222,223.5.5.5,223.6.6.6,240c::6644,240c::6666,2400:da00::6666,2001:4860:4860::8844,2001:4860:4860::8888,2606:4700:4700::1001,2606:4700:4700::1111"
o.description = translate("Muitiple DNS server can saperate with ','")
o:depends("dns", 1)

return m

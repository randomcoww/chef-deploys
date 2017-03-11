node.default['environment']['lan_subnet'] = "192.168.62.0/23"
node.default['environment']['lan_vip_gateway'] = "192.168.62.240/23"
node.default['environment']['lan_subnet_dhcp'] = "192.168.62.32/27"
node.default['environment']['lan_if'] = "brlan"
node.default['environment']['lan_vrrp_state'] = "MASTER"
node.default['environment']['lan_vrrp_id'] = 20
node.default['environment']['lan_vrrp_priority'] = 200

node.default['environment']['vpn_subnet'] = "192.168.30.0/23"
node.default['environment']['vpn_subnet_dhcp'] = "192.168.30.32/27"
node.default['environment']['vpn_if'] = "brvpn"

node.default['environment']['wan_if'] = "eth1"

node.default['environment']['dns_if'] = "eth0"
node.default['environment']['dns_vip'] = "192.168.62.250/23"

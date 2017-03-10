dbag = Dbag::Keystore.new(
  node['keepalived']['gateway']['auth_data_bag'],
  node['keepalived']['gateway']['auth_data_bag_item']
)
password = dbag.get_or_create('VG1', SecureRandom.base64(6))

keepalived_vrrp_sync_group 'VG1' do
  group [ "VI1" ]
end

keepalived_vrrp_instance 'VI1' do
  state node['environment']['lan_vrrp_state']
  interface node['environment']['lan_if']
  virtual_router_id node['environment']['lan_vrrp_id']
  priority node['environment']['lan_vrrp_priority']
  authentication auth_type: 'PASS', auth_pass: password
  virtual_ipaddress [ node['environment']['lan_vip_gateway'] ]
end

include_recipe 'keepalived::default'
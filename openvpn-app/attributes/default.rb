node.default['openvpn']['pkg_update_command'] = "apt-get update -qqy"
node.default['openvpn']['pkg_names'] = ['openvpn']
node.default['openvpn']['client'] = {
  'config' => {
    "client" => true,
    "dev" => "tun",
    "proto" => "udp",
    "remote" => ["us-seattle.privateinternetaccess.com", 1194],
    "resolv-retry" => "infinite",
    "nobind"  => true,
    "persist-key" => true,
    "persist-tun" => true,
    "ca" => "ca.crt",
    "tls-client" => true,
    "remote-cert-tls" => "server",
    "auth-user-pass" => "auth.conf",
    "comp-lzo" => true,
    "verb" => 3,
    "reneg-sec" => 0,
    "cipher" => "BF-CBC",
    "keepalive" => [10, 30],
    "route-nopull" => true,
    "redirect-gateway" => true,
    "fast-io" => true,
  },
  'auth-user-pass' => {
    'data_bag' => 'deploy_config',
    'data_bag_item' => 'openvpn_pia_v2',
    'key' => 'auth-user-pass'
  },
  'ca' => {
    'data_bag' => 'deploy_config',
    'data_bag_item' => 'openvpn_pia_v2',
    'key' => 'ca.crt'
  }
}
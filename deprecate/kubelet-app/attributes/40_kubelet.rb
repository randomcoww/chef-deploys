## master
node.default['kubernetes']['kubelet']['command'] = [
  node['kubernetes']['kubelet']['binary_path'],
  "--api-servers=http://127.0.0.1:#{node['kubernetes']['insecure_port']}",
  "--pod-manifest-path=#{node['kubernetes']['manifests_path']}",
  # "--cluster-dns=#{node['kubernetes']['cluster_dns_ip']}",
  # "--cluster-domain=#{node['kubernetes']['cluster_domain']}",
  "--register-schedulable=false",
  "--hostname-override=#{node['kubernetes']['node_ip']}",
  "--allow-privileged=true"
  # "--resolv-conf=''"
]

node.default['kubernetes']['kubelet']['systemd'] = {
  'Unit' => {
    'Description' => 'Kubelet'
  },
  'Service' => {
    "Restart" => 'always',
    "RestartSec" => 5,
    "ExecStart" => node['kubernetes']['kubelet']['command'].join(' ')
  },
  'Install' => {
    'WantedBy' => 'multi-user.target'
  }
}
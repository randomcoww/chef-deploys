dbag = Dbag::Keystore.new(
  node['ddclient']['data_bag'],
  node['ddclient']['data_bag_item']
)
config = dbag.get('freedns')

execute "pkg_update" do
  command node['ddclient']['pkg_update_command']
  action :run
end

package node['ddclient']['pkg_names'] do
  action :upgrade
  notifies :restart, "service[ddclient]", :delayed
end

ddclient_config 'freedns' do
  config node['ddclient']['freedns_template'].to_hash.merge(config)
  action :create
end

include_recipe "ddclient::service"

include_recipe "kube_master::etcd"
include_recipe "kube_master::flannel"
include_recipe "kube_master::docker"
include_recipe "kube_master::kubelet"
include_recipe "kube_master::pods"

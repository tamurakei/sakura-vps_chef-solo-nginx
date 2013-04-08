#
# iptables
#

#
# Configuration files
#
template "/etc/sysconfig/iptables" do
  source "iptables.erb"
  owner "root"
  group "root"
  mode "0600"
  notifies :restart, "service[iptables]"
end


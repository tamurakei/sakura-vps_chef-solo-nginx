#
# sshd
#

#
# service
#
service "sshd" do
    supports :status => true, :restart => true, :reload => true
end

#
# Configuration files
#
template "/etc/ssh/sshd_config" do
  source "sshd_config.erb"
  owner "root"
  group "root"
  mode "0600"
  notifies :restart, "service[sshd]"
end


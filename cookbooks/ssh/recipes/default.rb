#
# = ssh
#

#
# Configuration files
#
template "/etc/ssh/sshd_config" do
  source "ssh.erb"
  owner "root"
  group "root"
  mode "0600"
#  notifies :restart, "service[ssh]"
end


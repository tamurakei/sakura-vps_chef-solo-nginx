#
# sshd
#

#
# command
#
service "sshd" do
    stop_command    "/etc/init.d/sshd stop"
    start_command   "/etc/init.d/sshd start"
    restart_command "/etc/init.d/sshd restart"
    action :nothing
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


#
# powerdns
#

#
# Package install
#
package "powerdns" do
    action :install
    not_if "rpm -q powerdns"
end

package "pdns-backend-mysql" do
    action :install
    not_if "rpm -q pdns-backend-mysql"
end

package "mysql-server" do
    action :install
    not_if "rpm -q mysql-server"
end

#
# command
#
service "powerdns" do
    stop_command    "service pdns stop"
    start_command   "service pdns start"
    restart_command "service pdns restart"
    action :nothing
end

#
# Configuration files
#
template "/etc/pdns/pdns.conf" do
    source "pdns.conf"
    owner "root"
    group "root"
    mode "0600"
    notifies :restart, "service[powerdns]"
end




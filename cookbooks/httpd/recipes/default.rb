#
# httpd
#

#
# Package install
#
package "httpd" do
    action :install
    not_if "rpm -q httpd"
end

package "mod_ssl" do
    action :install
    not_if "rpm -q mod_ssl"
end

#
# chkconfig
#
execute "chkconfig --add httpd" do
    command "chkconfig --add httpd"
end
execute "chkconfig httpd on" do
    command "chkconfig httpd on"
end

#
# service
#
service "httpd" do
    supports :status => true, :restart => true, :reload => true
    action [ :enable , :start ]
end



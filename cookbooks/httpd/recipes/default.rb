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
execute "chkconfig httpd on" do
    command "chkconfig httpd on"
end



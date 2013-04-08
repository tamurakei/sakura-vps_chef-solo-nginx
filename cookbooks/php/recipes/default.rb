#
# php
#

#
# Package install
#
package "php" do
    action :install
    not_if "rpm -q php"
end

package "php-gd" do
    action :install
    not_if "rpm -q php-gd"
end

package "php-mbstring" do
    action :install
    not_if "rpm -q php-mbstring"
end

#
# service
#
service "httpd" do
    action [ :enable , :restart ]
end





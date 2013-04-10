#
# wordpress
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

package "php-xml" do
    action :install
    not_if "rpm -q php-mbstring"
end

package "php-mysql" do
    action :install
    not_if "rpm -q php-mbstring"
end

remote_file "/tmp/wordpress-3.5.1-ja.tar.gz" do
    source "http://ja.wordpress.org/wordpress-3.5.1-ja.tar.gz"
end

execute "install-wordpress" do
    command "tar zxvf /tmp/wordpress-3.5.1-ja.tar.gz -C /tmp/ && mv /tmp/wordpress/* /var/www/html/"
end

package "mysql-server" do
    action :install
    not_if "rpm -q mysql-server"
end

#
# chkconfig
#
execute "chkconfig --add mysqld" do
    command "chkconfig --add mysqld"
end
execute "chkconfig mysqld on" do
    command "chkconfig mysqld on"
end

#
# service
#
service "mysqld" do
    supports :status => true, :restart => true, :reload => true
    action [ :enable , :start ]
end

#
# Settings
#
cookbook_file "/tmp/wordpress-SQL.txt" do
    source "SQL.txt"
    mode 0644
    owner "root"
    group "root"
end
bash "sql-wordpress" do
    code <<-EOC
    mysql -u root < /tmp/wordpress-SQL.txt
    EOC
end

#
# service
#
service "httpd" do
    action [ :enable , :restart ]
end





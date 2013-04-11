#
# wordpress
#
require "socket"

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
    command "tar zxvf /tmp/wordpress-3.5.1-ja.tar.gz -C /tmp/ && mv /tmp/wordpress/* /var/www/html/ && chown -R apache:apache /var/www/html/"
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
execute "chkconfig --add httpd" do
    command "chkconfig --add httpd"
end
execute "chkconfig httpd on" do
    command "chkconfig httpd on"
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
template "/tmp/wordpress-SQL.txt" do
    source "SQL.erb"
    owner "root"
    group "root"
    mode "0600"
end
bash "sql-wordpress" do
    code <<-EOC
    mysql -u root < /tmp/wordpress-SQL.txt
    EOC
end

template "/var/www/html/wp-config.php" do
    source "wp-config.php.erb"
    owner "root"
    group "root"
    mode "0644"
end

#file "/var/www/html/wp-admin/setup-config.php" do
#    action :delete
#end



#
# service
#
service "httpd" do
    action [ :enable , :restart ]
end

#
# log
#
log "インストール後の作業" do
    message "このURLからWordPressの設定を完了させてください。 http://#{IPSocket::getaddress(Socket::gethostname)}/wp-admin/install.php "
    level :info
end




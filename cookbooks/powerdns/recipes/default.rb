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

service "pdns" do
    supports :status => true, :restart => true, :reload => true
end

#
# Configuration files
#
template "/etc/pdns/pdns.conf" do
    source "pdns.conf.erb"
    owner "root"
    group "root"
    mode "0600"
    notifies :restart, "service[pdns]"
end


#
# Settings
#
template "/tmp/pdns-SQL.txt" do
    source "SQL.erb"
    mode "0644"
    owner "root"
    group "root"
end
bash "sql-powerdns" do
    code <<-EOC
    mysql -u root < /tmp/pdns-SQL.txt
    EOC
end

#
# PowerAdmin
#
package "php" do
    action :install
    not_if "rpm -q php"
end
package "php-mbstring" do
    action :install
    not_if "rpm -q php-mbstring"
end
package "php-mcrypt" do
    action :install
    not_if "rpm -q php-mcrypt"
end
package "php-mysql" do
    action :install
    not_if "rpm -q php-mysql"
end
package "php-pdo" do
    action :install
    not_if "rpm -q php-pdo"
end

git "/tmp/poweradmin" do
    repository "git://github.com/poweradmin/poweradmin.git"
    reference "master"
    action :checkout
end
bash "install-poweradmin" do
    code <<-EOC
    cp -Rfp /tmp/poweradmin /var/www/html/
    EOC
end

#
# Configuration files
#
template "/var/www/html/poweradmin/inc/config.inc.php" do
    source "poweradmin.config.php.erb"
    owner "root"
    group "root"
    mode "0644"
end

bash "sql-poweradmin" do
    code <<-EOC
    mysql -u root #{node["powerdns"]["db_name"]} < /var/www/html/poweradmin/sql/poweradmin-mysql-db-structure.sql
    EOC
end


file "/var/www/html/poweradmin/install/database-structure.inc.php" do
    action :delete
end
file "/var/www/html/poweradmin/install/index.php" do
    action :delete
end
directory "/var/www/html/poweradmin/install" do
    action :delete
end

#
# service
#
service "httpd" do
    action [ :enable , :restart ]
end

#
# log
#
log "PowerDNSインストール後の作業" do
    message "PowerDNSのステータス確認URLは http://#{node['powerdns']['webserver-address']}:8081/ です。ID: admin PWD: #{node['powerdns']['webserver-password']} でログインしてください。"
    level :info
end
log "PowerAdminインストール後の作業" do
    message "PowerAdminのURLは http://#{node['powerdns']['webserver-address']}/poweradmin/ です。ID:admin PWD:adminでログインしてください。ログイン後、すぐにPWDを変更しましょう。"
    level :info
end


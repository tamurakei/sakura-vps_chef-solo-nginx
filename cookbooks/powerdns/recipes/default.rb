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
execute "mysql run SQL" do
    command "mysql -u root < #{node.dir.files}/SQL.txt"
end

#
# PowerAdmin
#
git "/tmp/poweradmin" do
    repository "git://github.com/poweradmin/poweradmin.git" reference "master"
    action :checkout
end
bash "install-poweradmin" do
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




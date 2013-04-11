#
# sshd
#

#
# service
#
service "sshd" do
    supports :status => true, :restart => true, :reload => true
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

#
# ntpd
#
execute "chkconfig --add mysqld" do
    command "echo '35 2 * * * /usr/sbin/ntpdate -s ntp.jst.mfeed.ad.jp' >> /var/spool/cron/root"
end




# powerdns attributes
require "socket"

default['powerdns']['webserver-address'] = IPSocket::getaddress(Socket::gethostname)
default['powerdns']['webserver-port'] = '8081'

default['powerdns']['db_host'] = 'localhost'
default['powerdns']['db_user'] = 'pdns'
default['powerdns']['db_pass'] = 'pdns'
default['powerdns']['db_name'] = 'pdns'
default['powerdns']['session_key'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['powerdns']['dns_hostmaster'] = ''
default['powerdns']['dns_ns1'] = ''
default['powerdns']['dns_ns1'] = ''
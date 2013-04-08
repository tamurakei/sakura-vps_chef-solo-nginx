# powerdns attributes
require "socket"

default['powerdns']['webserver-address'] = IPSocket::getaddress(Socket::gethostname)
default['powerdns']['webserver-port'] = '8081'

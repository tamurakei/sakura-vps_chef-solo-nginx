name "sakura-vps"
description "for SAKURA Internet VPS Server"
run_list(
  "recipe[sshd]",
  "recipe[iptables]",
  "recipe[httpd]",
  "recipe[php]",
　"recipe[powerdns]"
)

default_attributes({
  :role                => "sakura-vps",
})

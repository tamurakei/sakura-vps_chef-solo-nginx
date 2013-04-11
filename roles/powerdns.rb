name "powerdns"
description "powerdns for SAKURA Internet VPS Server"
run_list(
  "recipe[sshd]",
  "recipe[iptables]",
  "recipe[powerdns]",
)

default_attributes({
  :role                => "powerdns",
})

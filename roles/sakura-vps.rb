name "sakura-vps"
description "for SAKURA Internet VPS Server"
run_list(
  "recipe[sshd]",
  "recipe[iptables]",
)

default_attributes({
  :role                => "sakura-vps",
})

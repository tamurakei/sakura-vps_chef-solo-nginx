name "sakura-vps"
description "for SAKURA Internet VPS Server"
run_list(
  "recipe[ssh]",
  "recipe[iptables]",
)

default_attributes({
  :role                => "sakura-vps",
})

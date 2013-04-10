name "wordpress"
description "wordpress for SAKURA Internet VPS Server"
run_list(
  "recipe[sshd]",
  "recipe[iptables]",
  "recipe[wordpress]",
)

default_attributes({
  :role                => "wordpress",
})

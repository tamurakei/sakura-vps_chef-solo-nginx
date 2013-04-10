# wordpress attributes

default['wordpress']['DB_NAME'] = 'wordpress'
default['wordpress']['DB_USER'] = 'wpuser'
default['wordpress']['DB_PASSWORD'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['AUTH_KEY'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['SECURE_AUTH_KEY'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['LOGGED_IN_KEY'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['NONCE_KEY'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['AUTH_SALT'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['SECURE_AUTH_SALT'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['LOGGED_IN_SALT'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join
default['wordpress']['NONCE_SALT'] = (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).shuffle[0..7].join


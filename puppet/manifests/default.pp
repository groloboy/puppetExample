# exec { 'yum-update':
#     command => "/usr/bin/yum -y update"
# }

package { "mongodb":
    ensure => installed,
    # require => Exec["yum-update"]
}

service{ "mongodb":
    ensure => running,
    require => Package['mongodb']    
}

package { "redis-server":
    ensure => latest,
    # require => Exec["yum-update"]
}

service{ "redis-server":
    ensure => running,
    require => Package['redis-server']    
}

file { "/home/vagrant/project":
    ensure => "directory",
    owner => "vagrant",
    group => "vagrant",
    mode => 750,

}

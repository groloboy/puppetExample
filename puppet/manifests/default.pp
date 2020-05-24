
package { "redis-server":
    ensure => latest,
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

$nameservers = ['192.168.50.2']

 file { '/etc/resolv.conf':
   ensure  => file,
   owner   => 'root',
   group   => 'root',
   mode    => '0644',
   content => template('resolver/resolv.conf.erb'),
 }

# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  $nameservers = ['192.168.50.2']

  file { '/etc/resolv.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('resolver/resolv.conf.erb'),
  }
  file { '/etc/selinux/config':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0664',
    content => template('baseconfig/config'),
  }
}

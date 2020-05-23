# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  host { 'hostmachine':
    ip => '192.168.0.1';
  }

  package { ['vsftpd','httpd','bind', 'bind-utils','lynx','git', 'tree', 'unzip']:
    ensure => present;
  }
}

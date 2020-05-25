class http inherits baseconfig {
  package { 'httpd':
    ensure => present,
  }
  file { '/var/www/html/index.html':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/http/index.html',
    path    => '/var/www/html/index.html',
  }
  service { "httpd":
    ensure => running,
    enable => true,
    require => Package['httpd'],
    subscribe => File['/etc/httpd/conf/httpd.conf'],
  }
  file { '/etc/httpd/conf/httpd.conf':
    ensure  => file,
    require => Package['httpd'],
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/http/httpd.conf',
    path    => '/etc/httpd/conf/httpd.conf',
  }
}


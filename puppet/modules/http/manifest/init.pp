class http inherits baseconfig {
  package { 'httpd':
    ensure => present;
  }
  service { "httpd":
    ensure => running,
    enable => true,
    require => Package['httpd'],
    subscribe => File['/etc/httpd/conf/httpd.conf'],
  }
  file { '/var/www/html/index.html':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/http/index.html'),
    path    => '/var/www/html/index.html',
  }
  file { '/etc/httpd/conf/httpd.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('http/httpd.conf'),
  }
}


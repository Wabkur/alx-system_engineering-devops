# script to install nginx using puppet

# Install nginx with pupet
package { 'nginx':
  ensure => installed,
}

file_line { 'install':
  ensure => 'present',
  peth   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/ permanent;',
}

file { '/var/www/html/index.html';
  content => 'hello World',
}

service { 'nginx':
  ensure  => running.
  require => package['nginx'],
}

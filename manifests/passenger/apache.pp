class ruby::passenger::apache {
  include ::ruby::passenger
  include ::buildenv::cpp
  include ::buildenv::apache

  $passenger_root = $ruby::passenger::passenger_root

  $dev_package = $::osfamily ? {
    'RedHat' => 'httpd-devel',
    'Debian' => 'apache2-threaded-dev',
  }

  package { 'apache-dev':
    ensure => present,
    name   => $dev_package,
  }

  exec { 'install passenger':
    command   => "${passenger_root}/bin/passenger-install-apache2-module --auto",
    creates   => "${passenger_root}/ext/apache2/mod_passenger.so",
    subscribe => Package['passenger'],
    require   => [
      Class['ruby::passenger'],
      Class['buildenv::cpp'],
      Class['buildenv::apache'],
      ],
  }

  $passenger_load_path = $::osfamily ? {
    'RedHat' => '/etc/httpd/mods-available/passenger.load',
    'Debian' => '/etc/apache2/mods-available/passenger.load',
  }

  file { 'passenger.load':
    ensure  => file,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    seltype => 'httpd_config_t',
    path    => $passenger_load_path,
    require => [
      Exec['install passenger'],
      Package['httpd']
      ],
    content => "# file managed by puppet
LoadModule passenger_module ${passenger_root}/ext/apache2/mod_passenger.so
PassengerRoot ${passenger_root}
PassengerRuby /usr/bin/ruby
",
  }

}

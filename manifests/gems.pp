# this class just installs the minimal stuff needed to run "gem install"
class ruby::gems {

  if $::operatingsystem == 'Ubuntu' and versioncmp($::operatingsystemmajrelease, '14.04') >= 0 {
    $rubygems_pkg = 'ruby'
  } else {
    $rubygems_pkg = 'rubygems'
  }

  package { $rubygems_pkg:
    ensure => present,
  }

  $ruby_dev_pkg = $::osfamily ? {
    'RedHat' => 'ruby-devel',
    'Debian' => 'ruby-dev',
  }

  package { 'ruby-dev':
    ensure => present,
    name   => $ruby_dev_pkg,
  }

  if $::osfamily == 'Debian' {
    package { 'rake':
      ensure => present,
    }
  }
}

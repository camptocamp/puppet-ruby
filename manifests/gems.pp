# this class just installs the minimal stuff needed to run "gem install"
class ruby::gems {

  if $::lsbdistid == 'Ubuntu' and $::lsbdistrelease >= '14.04' {
    $rubygems_pkg = 'ruby'
  } else {
    $rubygems_pkg = 'rubygems'
  }

  package { $rubygems_pkg:
    ensure => present
  }

  package { 'ruby-dev':
    ensure => present,
    name   => $::osfamily ? {
      'RedHat' => 'ruby-devel',
      'Debian' => 'ruby-dev',
    },
  }

  if $::osfamily == 'Debian' {
    package { 'rake':
      ensure => present
    }
  }
}

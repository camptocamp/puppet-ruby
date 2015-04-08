# this class just installs the minimal stuff needed to run "gem install"
class ruby::gems {

  case $::operatingsystem {
    'Debian': {
      if versioncmp($::lsbdistrelease, '8') >= 0 {
        $rubygems_pkg = 'ruby'
      } else {
        $rubygems_pkg = 'rubygems'
      }
    }

    'Ubuntu': {
      if versioncmp($::lsbdistrelease, '14.04') >= 0 {
        $rubygems_pkg = 'ruby'
      } else {
        $rubygems_pkg = 'rubygems'
      }
    }

    'RedHat', 'CentOS': {
      $rubygems_pkg = 'rubygems'
    }

    default: {
      fail "Unsupported OS ${::operatingsystem}"
    }
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

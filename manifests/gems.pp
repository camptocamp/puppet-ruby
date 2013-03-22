# this class just installs the minimal stuff needed to run "gem install"
class ruby::gems {

  package { 'rubygems':
    ensure => present
  }

  package { 'ruby-dev':
    ensure => present,
    name   => $::osfamily ? {
      'RedHat' => 'ruby-devel',
      'Debian' => 'ruby-dev',
    },
  }

  if $::osfamily =~ 'Debian' {
    package { 'rake':
      ensure => present
    }
  }
}

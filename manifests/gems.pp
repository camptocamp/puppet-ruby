# this class just installs the minimal stuff needed to run "gem install"
class ruby::gems {

  package { "rubygems":
    ensure => present
  }

  package { "ruby-dev":
    ensure => present,
    name   => $operatingsystem ? {
      /RedHat|CentOS|Fedora/   => "ruby-devel",
      /Debian|Ubuntu|kFreeBSD/ => "ruby-dev",
    },
  }

  if $operatingsystem =~ /Debian|Ubuntu|kFreeBSD/ {
    package { "rake":
      ensure => present
    }
  }
}

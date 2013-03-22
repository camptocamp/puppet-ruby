# you'll probably want to include "ruby::gems" along with this
class ruby::passenger (
  $passenger_version = '2.2.2'
) {
  $passenger_root = $::osfamily ? {
    RedHat => "/usr/lib/ruby/gems/1.8/gems/passenger-${passenger_version}",
    debian => "/var/lib/gems/1.8/gems/passenger-${passenger_version}",
  }

  package { 'passenger':
    ensure   => $passenger_version,
    provider => 'gem',
    require  => Package['ruby-dev'],
  }

}

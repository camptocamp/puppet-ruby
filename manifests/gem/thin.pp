# == Class: ruby::gem::thin
#
# Declare Thin (a Ruby web-server based on Mongrel 
# as virtual resource
#
# === Example
#
#  include ruby::gems
#  include ruby::gem::thin
#  Package <| alias == 'thin' |>
#
class ruby::gem::thin {

  include buildenv::cpp

  @package {'thin':
    provider => 'gem',
    alias    => 'thin',
    require  => Package['g++'],
  }

}

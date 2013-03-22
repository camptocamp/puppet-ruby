# == Class: ruby::gem::tzinfo
#
# Declare TZinfo (a Ruby library that uses the standard
# Time Zone Database) as virtual resource
#
# === Example
#
#  include ruby::gems
#  include ruby::gem::tzinfo
#  Package <| alias == 'ruby-tzinfo' |>
#
class ruby::gem::tzinfo {

  @package {'tzinfo':
    provider => 'gem',
    alias    => 'ruby-tzinfo',
  }

}

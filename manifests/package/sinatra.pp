# == Class: ruby::package::sinatra
#
# Declare Sinatra web application library as virtual resource
#
# === Example
#
#  include ruby::package::sinatra
#  Package <| alias == 'ruby-sinatra' |>
#
class ruby::package::sinatra {

  validate_re(
    $::osfamily,
    ['^RedHat$','^Debian$'],
    "Unsupported os family ${::osfamily}"
  )

  $package_name = $::osfamily ? {
    'RedHat' => 'rubygem-sinatra',
    'Debian' => 'ruby-sinatra',
  }

  @package {$package_name:
    alias  => 'ruby-sinatra',
  }

}

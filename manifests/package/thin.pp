# == Class: ruby::package::thin
#
# Declare Thin (a Ruby web-server based on Mongrel)
# as virtual resource
#
# === Example
#
#  include ruby::package::thin
#  Package <| alias == 'thin' |>
#
class ruby::package::thin {

  validate_re(
    $::osfamily,
    ['^RedHat$','^Debian$'],
    "Unsupported os family ${::osfamily}"
  )

  $package_name = $::osfamily ? {
    'RedHat' => 'rubygem-thin',
    'Debian' => 'thin',
  }

  @package {$package_name:
    alias  => 'ruby-thin',
  }

}

# == Class: ruby::package::json
#
# Declare JSON library package as virtual resource.
#
# === Example
#
#  include ruby::package::json
#  Package <| alias == 'ruby-json' |>
#
class ruby::package::json {

  validate_re(
    $::osfamily,
    ['^RedHat$','^Debian$'],
    "Unsupported os family ${::osfamily}"
  )

  $package_name = $::osfamily ? {
    'RedHat' => 'rubygem-json',
    'Debian' => 'ruby-json',
  }

  @package {$package_name:
    alias  => 'ruby-json',
  }

}

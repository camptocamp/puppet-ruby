# == Class: ruby::package::fastercsv
#
# Declare Ruby‘s standard CSV library package as
# virtual resource.
#
# === Example
#
#  include ruby::package::fastercsv
#  Package <| alias == 'ruby-fastercsv' |>
#
class ruby::package::fastercsv {

  validate_re(
    $::osfamily,
    ['^RedHat$','^Debian$'],
    "Unsupported os family ${::osfamily}"
  )

  $package_name = $::osfamily ? {
    'RedHat' => 'rubygem-fastercsv',
    'Debian' => 'ruby-fastercsv',
  }

  @package {$package_name:
    alias  => 'ruby-fastercsv',
  }

}

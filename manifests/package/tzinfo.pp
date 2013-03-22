# == Class: ruby::package::tzinfo
#
# Declare TZinfo (a Ruby library that uses the standard
# Time Zone Database) as virtual resource
#
# === Example
#
#  include ruby::package::tzinfo
#  Package <| alias == 'ruby-tzinfo' |>
#
class ruby::package::tzinfo {

  validate_re(
    $::osfamily,
    ['^RedHat$','^Debian$'],
    "Unsupported os family ${::osfamily}"
  )

  $package_name = $::osfamily ? {
    'RedHat' => 'rubygem-tzinfo',
    'Debian' => 'ruby-tzinfo',
  }

  @package {$package_name:
    alias  => 'ruby-tzinfo',
  }

}

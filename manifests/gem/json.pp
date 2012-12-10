# == Class: ruby::gem::json
#
# Declare JSON library as virtual resource.
#
# === Example
#
#  include ruby::gems
#  include ruby::gem::json
#  Package <| alias == 'ruby-json' |>
#
class ruby::gem::json {

  @package {'json':
    provider => 'gem',
    alias    => 'ruby-json',
  }

}

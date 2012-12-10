# == Class: ruby::gem::sinatra
#
# Declare Sinatra web application library as virtual resource 
#
# === Example
#
#  include ruby::gems
#  include ruby::gem::sinatra
#  Package <| alias == 'sinatra' |>
#
class ruby::gem::sinatra {

  @package {'sinatra':
    provider => 'gem',
    alias    => 'sinatra',
  }

}

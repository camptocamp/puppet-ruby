require 'spec_helper'

describe 'ruby::gems' do
  let(:facts) { {
    :lsbdistid => 'Debian',
    :osfamily  => 'Debian',
  } }
  it { should compile.with_all_deps }
end

require 'spec_helper'

describe 'ruby::gems' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { should compile.with_all_deps }

      if facts[:operatingsystem] == 'Debian' && facts[:lsbmajdistrelease] == '8'
        it { is_expected.not_to contain_package('rubygems') }
        it { is_expected.to contain_package('ruby') }
      elsif facts[:operatingsystem] == 'Ubuntu' && facts[:lsbmajdistrelease] == '14'
        it { is_expected.not_to contain_package('rubygems') }
        it { is_expected.to contain_package('ruby') }
      else
        it { is_expected.to contain_package('rubygems') }
        it { is_expected.not_to contain_package('ruby') }
      end
    end
  end
end

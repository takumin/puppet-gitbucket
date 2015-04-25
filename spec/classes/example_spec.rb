require 'spec_helper'

describe 'gitbucket' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "gitbucket class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('gitbucket::params') }
          it { is_expected.to contain_class('gitbucket::install').that_comes_before('gitbucket::config') }
          it { is_expected.to contain_class('gitbucket::config') }
          it { is_expected.to contain_class('gitbucket::service').that_subscribes_to('gitbucket::config') }

          it { is_expected.to contain_service('gitbucket') }
          it { is_expected.to contain_package('gitbucket').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'gitbucket class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('gitbucket') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end

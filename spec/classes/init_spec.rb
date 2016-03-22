require 'spec_helper'
describe 'repo_fedora' do

  context 'with defaults for all parameters' do
    it { should contain_class('repo_fedora') }
  end
end

require File.expand_path('../support/helpers', __FILE__)

describe 'ubuntu-workstation::default' do

  include Helpers::Ubuntu_workstation

  # Example spec tests can be found at http://git.io/Fahwsw
  it 'installs moreutils' do
  	package('moreutils').must_be_installed
  end

end

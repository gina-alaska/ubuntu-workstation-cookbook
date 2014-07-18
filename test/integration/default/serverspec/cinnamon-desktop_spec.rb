require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

# RSpec.configure do |c|
# 	c.before :all do
# 		c.path = "/sbin:/usr/sbin"
# 	end
# end

# Documentation for writing tests can be found at:
#  http://serverspec.org/
describe "cinnamon-desktop" do
	it 'installs the cinnamon desktop' do
		expect(package('cinnamon')).to be_installed
	end

	it 'installs lightdm' do
		expect(package('lightdm')).to be_installed
	end
end

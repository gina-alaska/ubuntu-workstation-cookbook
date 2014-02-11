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
describe "gnome-desktop" do
	it 'installs the gnome desktop' do
		expect(package('gnome')).to be_installed
	end

	it 'sets the default desktop' do
		expect(file('/etc/lightdm/lightdm.conf')).to contain("user-session=gnome")
	end

end

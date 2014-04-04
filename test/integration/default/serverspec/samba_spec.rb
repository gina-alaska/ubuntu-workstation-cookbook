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
describe "samba" do
	it 'installs samba' do
		expect(package('samba')).to be_installed
	end
end
describe "smbclient" do
	it 'installs smbclient' do
		expect(package('smbclient')).to be_installed
	end
end

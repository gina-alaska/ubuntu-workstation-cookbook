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
describe "feh" do
	it 'installs feh' do
		expect(package('feh')).to be_installed
	end
end

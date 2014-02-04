
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
describe "git" do
	it 'install git' do
		expect(package('git')).to be_installed
	end
end

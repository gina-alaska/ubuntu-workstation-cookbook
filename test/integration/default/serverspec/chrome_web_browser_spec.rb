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

describe ppa('chrome/deb') do
	it { should exist }
	it { should be_enabled }
end

describe "chrome_web_browser" do
	it 'installs the chrome web browser' do
		expect(package('google-chrome-stable')).to be_installed
	end
end

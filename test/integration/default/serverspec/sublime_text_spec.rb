require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS


describe "sublime text" do
	it 'installs sublime text' do
		expect(package("sublime-text")).to be_installed
	end
end

require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS


describe "moreutils" do
	it 'installs moreutil' do
		expect(package("moreutils")).to be_installed
	end
end

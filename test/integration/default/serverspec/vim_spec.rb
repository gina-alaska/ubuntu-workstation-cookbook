require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS


describe "vim" do
	it 'installs vim' do
		expect(package("vim")).to be_installed
	end
end

require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS


describe "nvidia" do
	it 'installs nvidia driver' do
		expect(package("nvidia-319")).to be_installed
	end
end

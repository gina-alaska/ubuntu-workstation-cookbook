require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS


describe "tmux" do
	it 'installs tmux' do
		expect(package("tmux")).to be_installed
	end
end

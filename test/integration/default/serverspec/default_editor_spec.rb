require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS


describe "default_editor" do
	it 'sets the default editor' do
		expect(file("/etc/alternatives/editor")).to be_linked_to ("/usr/bin/nano")
	end
end

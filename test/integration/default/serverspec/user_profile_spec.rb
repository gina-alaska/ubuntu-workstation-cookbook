require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS


describe "user_profile" do
	it 'creates profile.d script' do
		expect(file("/etc/profile.d/user_profile.sh")).to be_file 
		expect(file("/etc/profile.d/user_profile.sh")).to be_mode("755")
		expect(file("/etc/profile.d/user_profile.sh")).to contain("# This file is managed by Chef")
	end

	#TODO:  Figure out how to use chef node attributes
	it 'creates users .profile.d directory' do
		expect(file("/home/vagrant/.profile.d")).to be_directory
		expect(file("/home/vagrant/.profile.d")).to be_owned_by "vagrant"
	end
end
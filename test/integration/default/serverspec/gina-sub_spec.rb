require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS


describe "gina-sub" do
	it 'installs gina-sub' do
		#expect(package("SublimeText3")).to be_installed
		expect(file("/home/vagrant/.profile.d/gina-sub.sh")).to be_file
		expect(file("/home/vagrant/.profile.d/gina-sub.sh")).to be_mode("644")
		expect(file("/home/vagrant/.profile.d/gina-sub.sh")).to contain("eval \"$(${HOME}/.gina/bin/gina init -)\"")
	end
end

git "#{node['workstation_user']}/.gina" do
	repository "git@github.com/gina-alaska/gina-sub.git"
	reference "master"
	user node['workstation_user']
end

include_recipe "ubuntu_workstation::user_profile"

file "/home/#{node['workstation_user']}/.profile.d/gina-sub.sh" do
	mode "0644"
	user node['workstation_user']
	content "eval \"$(${HOME}/.gina/bin/gina init -)\""
end
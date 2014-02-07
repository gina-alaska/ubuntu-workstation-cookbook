include_recipe "ubuntu-workstation::user_profile"
include_recipe "ubuntu-workstation::git"

%w{libicu-dev}.each do |pkg|
	package pkg
end


# git "#{node['workstation_user']}/.gina" do
# 	repository node['gina-sub']['repo']
# 	reference "master"
# 	user node['workstation_user']
# 	not_if {::Dir.glob("/home/#{node['workstation_user']}/.ssh/*.pub").empty?}
# end


file "/home/#{node['workstation_user']}/.profile.d/gina-sub.sh" do
	mode "0644"
	user node['workstation_user']
	content "eval \"$(${HOME}/.gina/bin/gina init -)\""
end
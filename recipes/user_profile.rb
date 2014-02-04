cookbook_file "/etc/profile.d/user_profile.sh" do
	mode "0755"
	source "user_profile.sh"
end

directory "/home/#{node['workstation_user']}/.profile.d" do
	mode "0755"
	owner node['workstation_user']
end
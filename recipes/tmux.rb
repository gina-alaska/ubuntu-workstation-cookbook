package 'tmux'

# remote_file "/home/#{node['workstation_user']}/.tmux.conf" do
# 	source node['tmux']['config_file']
# 	user node['workstation_user']
# 	mode "0644"
# 	not_if { node['tmux']['config_file'].nil?}
# end
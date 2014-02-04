#Ensure you add the recipe that installs your editor to your run_list
execute "Install default editor" do
	command " update-alternatives --install /usr/bin/editor editor #{node['default_editor']} 10"
	not_if {node['default_editor'].nil?}
end

execute "Set default editor" do
	command "update-alternatives --set editor #{node['default_editor']}"
	not_if {node['default_editor'].nil?}	
end
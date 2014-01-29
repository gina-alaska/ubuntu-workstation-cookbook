remote_file "#{Chef::Config[:file_cache_path]}/SublimeText3.deb" do
	source node['sublime_text']['download_url']
end

dpkg_package "#{Chef::Config[:file_cache_path]}/SublimeText3.deb"
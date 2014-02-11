define :default_desktop, fallback: "ubuntu" do 
	desktop = if ::File.exists? "/usr/share/xsessions/#{params[:name]}.desktop"
		params[:name]
	else
		params[:fallback]
	end

	execute "set_default_desktop" do
		command "/usr/lib/lightdm/lightdm-set-defaults -s #{desktop}"
		only_if { ::File.exists?("/usr/share/xsessions/#{desktop}.desktop")}
	end
end
#  Recipe for installing/configuring samba
include_recipe 'user::data_bag'

package_list = [ "samba", "smbclient" ]
service_list = [ "smbd", "nmbd" ]

Array(package_list).each do |p|
  package p do
    action :install
  end
end

Array(service_list).each do |s|
  service s do
    supports [:status]
    action [:enable, :start]
  end
end

template node["samba"]["config"] do
  source "smb.conf.erb"
  owner "root"
  group "root"
  mode 00644
  variables :shares => node["samba"]["shares"]
  Array(service_list).each do |s|
    notifies :restart, "service[#{s}]"
  end
end

# reimplement the lwrp functionality from the samba cookbook
require 'chef/mixin/shell_out'
require 'chef/mixin/language'
#include Chef::Mixin::ShellOut
ruby_block "the lwrp again" do
  block do
    #::Chef::Recipe.send(:include, Mixin::ShellOut)
    Chef::Resource::RubyBlock.send(:include,Chef::Mixin::ShellOut)
    Array(node["samba"]["users"]).each do |s|
      u = shell_out("pdbedit -Lv -u #{s.name}")
      exists = u.stdout.include?(s.name)
      disabled = u.stdout.include?("Account Flags.*[D")
      unless exists
        shell_out("echo '#{s.plaintextpassword}\n#{s.plaintextpassword}' | smbpasswd -s -a #{s.name}")
        #execute "Create #{s.name}" do
          #command "echo '#{s.plaintextpassword}\n#{s.plaintextpassword}' | smbpasswd -s -a #{s.name}"
        #end
      end
      if disabled
        shell_out("smbpasswd -e #{s.name}")
        #execute "Enable #{s.name}" do
          #command "smbpasswd -e #{s.name}"
        #end
      end
    end
  end
end

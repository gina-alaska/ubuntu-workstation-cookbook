## this stuff stolen from jtimberman/samba-cookbook server recipe version 0.11.4
## and modified slightly
default["samba"]["workgroup"] = "GINA"
default["samba"]["interfaces"] = "lo 127.0.0.1"
default["samba"]["hosts_allow"] = "127.0.0.0/8"
default["samba"]["bind_interfaces_only"] = "no"
default["samba"]["server_string"] = "Samba Server"
default["samba"]["load_printers"] = "no"
default["samba"]["passdb_backend"] = "tdbsam"
default["samba"]["dns_proxy"] = "no"
default["samba"]["security"] = "user"
default["samba"]["map_to_guest"] = "Bad User"
default["samba"]["socket_options"] = "TCP_NODELAY"

case platform
when "arch"
  set["samba"]["config"] = "/etc/samba/smb.conf"
  set["samba"]["log_dir"] = "/var/log/samba/log.%m"
when "redhat","centos","fedora","amazon","scientific"
  set["samba"]["config"] = "/etc/samba/smb.conf"
  set["samba"]["log_dir"] = "/var/log/samba/log.%m"
else
  set["samba"]["config"] = "/etc/samba/smb.conf"
  set["samba"]["log_dir"] = "/var/log/samba/%m.log"
end
## end stolen stuff

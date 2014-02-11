#  Recipe for installing/configuring gnome-desktop
package('lightdm')
package('gnome')

default_desktop "gnome" if node['gnome-desktop']['set_default']

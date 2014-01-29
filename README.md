# ubuntu-workstation cookbook

# Usage
Each recipe corresponds to a specific piece of software(ex: 'vim') that contains the necessary steps for installation and configuration of that package.

If you wish to group packages, you should probably use a role.  See [link_to_roles_documentation].

If you find yourself creating numerous related recipes,  you might consider breaking them into their own cookbook.  

Ex:  gnome, gnome-terminal, gnome-shell, gnome-keyring ...   should probably go into a 'gnome' cookbook'

# Attributes
Attributes should be in an appropriately named attriutes file, corresponding the the recipe name

# Author

Author:: UAFGINA (<scott@gina.alaska.edu>)

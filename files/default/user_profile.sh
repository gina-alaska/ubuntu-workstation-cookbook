# This file is managed by Chef
# CHANGES WILL BE OVERWRITTEN

#This loops over everything in $HOME/.profile.d and brings it into your environment.
# Adapted from /etc/profile  Ubuntu 13.04
if [ -d $HOME/.profile.d ]; then
  for i in $HOME/.profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
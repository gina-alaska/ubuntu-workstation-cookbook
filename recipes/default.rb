#
# Cookbook Name:: ubuntu-workstation
# Recipe:: default
#
# Copyright (C) 2014 UAFGINA
# 
# All rights reserved - Do Not Redistribute
#

#This recipe should only include the apt recipe, which forces an apt-get update if necessary

include_recipe "apt"
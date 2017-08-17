#
# Cookbook:: mongodb-server
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# apt_update
apt_repository "mongodb-org" do

  components ["multiverse"]
  uri "http://repo.mongodb.org/apt/ubuntu"
  distribution "xenial/mongodb-org/3.2"

  keyserver "hkp://keyserver.ubuntu.com:80"
  key "EA312927"

end

package 'nginx'

template "/lib/systemd/system/mongod.service" do
  source 'mongod.service.erb'
  mode '0755'
  owner 'root'
  group 'root'
  notifies :restart, "service[mongod]"
end

template "/etc/mongod.conf" do
  source 'mongod.conf.erb'
  mode '0755'
  owner 'root'
  group 'root'
  notifies :restart, "service[mongod]"
end

service "mongod" do
  supports :restart => true, :reload => true, :start => true
  action [:enable, :start]
end

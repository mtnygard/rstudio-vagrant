#
# Cookbook Name:: rstudio
# Recipe:: default
#
# Copyright 2011, Relevance, Inc.
#

include_recipe "apt"

apt_repository "cran" do
  uri "http://cran.opensourceresources.org/bin/linux/ubuntu lucid/"
  keyserver "keyserver.ubuntu.com"
  key "E084DAB9"
  action :add
  notifies :run, resources(:execute => "apt-get update"), :immediately
end

package "r-base" do
  options "--force-yes"
end

package "r-base-dev" do
  options "--force-yes"
end

user "rstudio" do
  comment "Application execution user"
  uid 2000
  gid "users"
  shell "/bin/false"
  home "/home/rstudio"
end

directory "/home/rstudio" do
  owner "rstudio"
  group "users"
  mode 0755
  action :create
end

remote_file "/tmp/rstudio-server-#{node[:rstudio][:version]}-amd64.deb" do
  source "https://s3.amazonaws.com/rstudio-server/rstudio-server-#{node[:rstudio][:version]}-amd64.deb"
  checksum "49cb16aacb8f2dfffbd8a440f1e8a8be0bc1364cb94f9521b49fcf9f0e8bb90c"
end

dpkg_package "rstudio-server" do
  source "/tmp/rstudio-server-#{node[:rstudio][:version]}-amd64.deb"
end


# coding: utf-8
#
# Cookbook Name:: sociedad_actua
# Recipe:: default
#
# Copyright 2015, Cívica Digital
#
# AGPL License
#

Chef::Resource::DockerContainer.send(:include, Creds::Helper)

chef_gem 'docker-api'
require 'docker'

include_recipe 'git'

docker_service 'default' do
  action [:create, :start]
end

docker_image "postgres" do
  tag "9.4"
  cmd_timeout 1800
end

docker_image "civicadigital/backup" do
  tag "latest"
  cmd_timeout 1800
end

docker_image "phusion/passenger-ruby22" do
  tag "latest"
  cmd_timeout 1800
end

directory '/var/log/actua' do
 owner 'root'
 group 'root'
 mode '0755'
 action :create
end

docker_container "postgres" do
  image "postgres"
  tag "9.4"
  container_name "postgres"
  detach true
  env "POSTGRES_PASSWORD=#{postgres_pwd}"
  cmd_timeout 600
end


directory "/www" do
  owner "root"
  group "root"
  mode  "755"
  action :create
end

directory "/www/sitios/" do
  owner "root"
  group "root"
  mode  "755"
  action :create
end

git "/www/sitios/sociedad_actua" do
  revision node["actua"]["branch"]
  repository "https://github.com/civica-digital/sociedad-actua.git"
  notifies :run, "docker_container[commit_db]", :immediately
  action :sync
end


docker_container "commit_db" do
  image "civicadigital/backup"
  env list_creds
  link ["postgres:postgres"]
  remove_automatically true
  command ""
  container_name "backup_db"
  ignore_failure true
  action :nothing
  notifies :run, "docker_image[actua]", :immediately
  cmd_timeout 600
end

docker_image 'actua' do
  tag 'latest'
  source "/www/sitios/sociedad_actua"
  action :build
  notifies :run, 'docker_container[actua_create]', :immediately
  cmd_timeout 2400
end

docker_container 'actua_create' do
  image "actua"
  entrypoint "rake"
  command "db:create"
  container_name "create_dbs"
  link ["postgres:postgres"]
  remove_automatically true
  env list_creds
  action :run
  notifies :run, "docker_container[actua_migrate]", :immediately
  cmd_timeout 1000
end

docker_container 'actua_migrate' do
  image "actua"
  entrypoint "rake"
  command "db:migrate"
  link ["postgres:postgres"]
  container_name "migrate_dbs"
  remove_automatically true
  env  list_creds
  action :nothing
  notifies :redeploy, "docker_container[sociedad_actua]", :immediately
  cmd_timeout 1000
end

docker_container "sociedad_actua" do
  image "actua"
  container_name "sociedad_actua"
  link ["postgres:postgres"]
  env  list_creds
  volume ["/www/sitios/sociedad_actua"]
  detach true
  port ['80:80', "443:443"]
  action :run
  cmd_timeout 600
end

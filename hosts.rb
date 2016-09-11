#!/usr/bin/ruby

require 'json'

hosts = Hash.new
hosts_vars = Hash.new

hosts[:containers] = {
  :hosts => [
    'web',
  ],
}

hosts_vars['web'] = {
  :ansible_connection => 'docker',
  :ansible_host => `docker-compose ps -q web`.strip,
}

if ARGV[0] == '--list'
  puts hosts.to_json
else
  puts hosts_vars[ARGV[1]].to_json
end

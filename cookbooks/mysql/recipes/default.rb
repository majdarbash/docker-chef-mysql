#
# Cookbook:: mysql
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

%w[
    /usr/local/scripts
    /usr/local/scripts/files
].each do |path|
    directory path do
        action :create
    end
end

bash 'apt-ppa' do
    code <<-EOH
        echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
        echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections

        apt update
    EOH
end

package ['mysql-server', 'mysql-client', 'supervisor'] do
  action :install
end


package ['vim', 'htop', 'ntp'] do
  action :install
end

template '/etc/mysql/mysql.conf.d/mysqld.cnf' do
  source 'mysqld.cnf'
end

bash 'mysql-script' do
    code <<-EOH
        mkdir -p /var/lib/mysql && \
        mkdir -p /var/run/mysqld && \
        mkdir -p /var/log/mysql && \
        chown -R mysql:mysql /var/lib/mysql && \
        chown -R mysql:mysql /var/run/mysqld && \
        chown -R mysql:mysql /var/log/mysql
    EOH
end


template '/etc/supervisor/conf.d/supervisord.conf' do
  source 'supervisord.conf'
end

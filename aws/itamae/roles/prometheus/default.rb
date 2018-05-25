include_recipe '../../cookbooks/docker/default.rb'
include_recipe '../../cookbooks/docker-compose/default.rb'

remote_file '/home/ubuntu/docker-compose.yml'
remote_file '/home/ubuntu/prometheus.yml' do
  mode "0644"
end
%w[
    /home/ubuntu/docker-compose.yml
    /home/ubuntu/prometheus.yml
    /home/ubuntu/exporter_cloudwatch_ec2.yml
    /home/ubuntu/exporter_cloudwatch_elb.yml
    /home/ubuntu/exporter_cloudwatch_ecs.yml
    /home/ubuntu/exporter_cloudwatch_rds.yml
    /home/ubuntu/exporter_cloudwatch_es.yml
].each do |file|
  remote_file file do
    mode '0644'
  end
end

remote_file '/etc/systemd/system/prometheus.service' do
  owner 'ubuntu'
  group 'ubuntu'
  mode '644'
end

service 'prometheus' do
  action [:enable, :restart]
  user 'root'
end

include_recipe '../../cookbooks/docker/default.rb'
include_recipe '../../cookbooks/docker-compose/default.rb'

remote_file '/home/ubuntu/docker-compose.yml'
remote_file '/home/ubuntu/prometheus.yml' do
  mode "0644"
end
%w[
    /home/ubuntu/docker-compose.yml
    /home/ubuntu/prometheus.yml
    /home/ubuntu/cloudwatch_exporter.yml
    /home/ubuntu/cloudwatch_exporter_config.yml
    /home/ubuntu/elb_config.yml
].each do |file|
  remote_file file do
    mode '0644'
  end
end

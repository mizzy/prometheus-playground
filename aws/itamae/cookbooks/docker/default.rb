%w[
  apt-transport-https
  ca-certificates
  curl
  software-properties-common
].each do |pkg|
  package pkg
end

execute "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -" do
  not_if "grep docker /etc/apt/sources.list"
end
execute 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"' do
  not_if "grep docker /etc/apt/sources.list"
end
execute 'apt-get update' do
  not_if "which docker"
end
package 'docker-ce'

execute 'sudo usermod -aG docker ubuntu' do
  not_if 'getent group docker|grep ubuntu'
end

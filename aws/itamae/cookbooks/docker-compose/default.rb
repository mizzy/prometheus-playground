case node[:platform]
when 'ubuntu'
  execute 'apt-get update' do
    not_if 'which docker-compose'
  end
  package 'python-pip' do
    not_if 'which docker-compose'
  end
  execute 'LC_ALL=C pip install docker-compose' do
    not_if 'which docker-compose'
  end
else
  execute 'curl -L "https://github.com/docker/compose/releases/download/1.20.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose'
end

action :create do
  yum_repository 'mongodb-org-3.2' do
    description 'MongoDB Repository'
    baseurl 'https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/'
    gpgcheck true
    gpgkey 'https://www.mongodb.org/static/pgp/server-3.2.asc'
    enabled true
    action :create
  end

  package 'mongodb-org'

  service 'mongod' do
    action [:enable, :start]
  end
end

action :delete do
  package 'mongodb-org' do
    action :remove
  end

  yum_repository 'mongodb-org-3.2' do
    action :delete
  end
end

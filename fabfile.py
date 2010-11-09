from fabric.api import env, local, sudo
env.user = 'root'
env.hosts = ['204.232.205.196']

env.chef_executable = '/var/lib/gems/1.8/bin/chef-solo'


def install_chef():
    sudo('apt-get update', pty=True)
    sudo('apt-get install -y git-core rubygems ruby ruby-dev', pty=True)
    sudo('gem install chef', pty=True)

def sync_config():
    local('rsync -av . %s@%s:/etc/chef' % (env.user, env.hosts[0]))

def update():
    sync_config()
    sudo('cd /etc/chef && %s' % env.chef_executable, pty=True)

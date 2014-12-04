stage { 'pre': }
Stage[pre] -> Stage[main]

/**
* setup some environment specific settings e.g. user permissions ...
*/
class environment { 
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }

  $ssh_username = "vagrant"
  
  file { "/home/${ssh_username}":
      ensure => directory,
      owner  => $ssh_username,
  }

  # copy dot files to ssh user's home directory
  exec { 'dotfiles':
    cwd     => "/home/${ssh_username}",
    command => "cp -r /vagrant/puppet/files/dot/.[a-zA-Z0-9]* /home/${ssh_username}/ \
                && chown -R ${ssh_username} /home/${ssh_username}/.[a-zA-Z0-9]* \
                && cp -r /vagrant/puppet/files/dot/.[a-zA-Z0-9]* /root/",
    onlyif  => 'test -d /vagrant/puppet/files/dot',
    returns => [0, 1],
  }
}
class { 'environment':
  stage    => 'pre',
}


class { 'yum':
  extrarepo => [ 'epel'],
}

include 'erlang'

class { '::rabbitmq':
  port              => '5672'
}


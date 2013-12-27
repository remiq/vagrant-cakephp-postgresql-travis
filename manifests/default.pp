



class baseconfig {
    exec { 'apt-get update':
        command =>  '/usr/bin/apt-get update'
    }
}



class nginx {
    package { 'nginx':
        ensure  =>  present
    }
    file { '/etc/nginx/sites-enabled/default':
        ensure  =>  absent,
        require =>  Package['nginx'],
        notify  =>  Service['nginx']
    }
    file { '/etc/nginx/sites-enabled/site.conf':
        ensure  =>  present,
        source  =>  '/vagrant/manifests/nginx/site.conf',
        require =>  Package['nginx'],
        notify  =>  Service['nginx']
    }
    service { 'nginx':
        ensure  =>  running,
        require =>  Package['nginx']
    }
}

class php5-fpm {
    require nginx
    package {'php5-fpm':
        ensure  =>  installed
    }
    package {'php5-cli':
        ensure  =>  installed
    }
    file { '/etc/php5/fpm/pool.d/site.conf':
        ensure  =>  present,
        source  =>  '/vagrant/manifests/php5-fpm/site.conf',
        require =>  Package['php5-fpm'],
        notify  =>  Service['php5-fpm']

    }
    service { 'php5-fpm':
        ensure  =>  running,
        require =>  Package['php5-fpm']
    }
}


class mysql {
    package { 'mysql-client':
        ensure => present,
    }

    package { 'mysql-server':
        ensure => present,
    }
    package { 'php5-mysql':
        ensure  =>  installed
    }
    #exec { 'mysql --user root -c "CREATE SCHEMA IF NOT EXISTS 'site' DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci" >> /vagrant/puppet-mysql.sql.log 2>&1':
    #    path    =>  ['/usr/bin', '/usr/sbin', '/bin'],
    #    user    =>  postgres,
    #    timeout => 600,
    #    require =>  Package['mysql-server']
    #}
    service { 'mysql':
        ensure  =>  running,
        require =>  Package['mysql-server']
    }
}

stage { 'pre':
    before  =>  Stage['main']
}
class {
    'baseconfig':
        stage => 'pre'
}
include php5-fpm, mysql

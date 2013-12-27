



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

class postgresql {
    package { 'postgresql':
        ensure => present
    }
    exec { 'psql -f /var/db/example.sql':
        user    =>  postgres,
        require => Package['postgresql']
    }
    service { 'posgresql':
        ensure => running,
        require => Package['postgresql']
    }
}


stage { 'pre':
    before  =>  Stage['main']
}
class {
    'baseconfig':
        stage => 'pre'
}
include php5-fpm, postgresql

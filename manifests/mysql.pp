# == Class: nextcloudmio::mysql
#

# == Class: mysql
#
# == Class: nextcloudmio:mysql
#
class nextcloudmio::mysql {

  service { 'mysql':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    pattern    => 'mysql',
  }
  mysql_user { 'createuser':
    ensure        => 'present',
    name          => 'nextcloudroot@localhost',
    password_hash => mysql_password('Cambiame123.'),
    require       => Service['mysql']
  }

  mysql_database { 'createdatabase':
    ensure  => 'present',
    name    => 'nextcloud',
    charset => 'utf8mb4',
    collate => 'utf8mb4_general_ci',
    require =>  Mysql_user['createuser'],



  }

  mysql_grant {'nextcloudroot@%/nextcloud.*':
    ensure     => 'present',
    privileges => 'ALL PRIVILEGES',
    options    => 'GRANT',
    user       => 'nextcloudroot@%',
    table      => 'nextcloud.*',
    require    => [Mysql_user['createuser'],
    Mysql_database['createdatabase'],
    ]
}


}

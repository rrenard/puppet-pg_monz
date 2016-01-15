# == Class pg_monz::install
#
# This class is called from pg_monz for install.
#
class pg_monz::install {

  file { $::pg_monz::install_dir :
    ensure  => directory,
    owner   => $::pg_monz::zabbix_user,
    group   => $::pg_monz::zabbix_group,
    mode    => "0750",
  } ->
      
  staging::file { "pg_monz-${::pg_monz::version}.tar.gz":
    source => "${::pg_monz::download_url}/${::pg_monz::version}.tar.gz",
  } ->

  staging::extract { "pg_monz-${::pg_monz::version}.tar.gz":
    target => "${::pg_monz::install_dir}",
    creates => "${::pg_monz::install_dir}/pg_monz-${::pg_monz::version}/LICENSE",
    user  => $::pg_monz::zabbix_user,
    group => $::pg_monz::zabbix_group,
  } ->

  file { "/usr/local/bin/pg_monz" :
    ensure  => link,
    owner   => $::pg_monz::zabbix_user,
    group   => $::pg_monz::zabbix_group,
    target  => "${::pg_monz::install_dir}/pg_monz-${::pg_monz::version}/pg_monz/usr-local-bin",
  } ->

  file { "/etc/pg_monz" :
    ensure  => directory,
    owner   => $::pg_monz::zabbix_user,
    group   => $::pg_monz::zabbix_group,
    mode    => '0750',
  } ->

  file { "/etc/pg_monz/pgsql_funcs.conf" :
    ensure  => present,
    owner   => $::pg_monz::zabbix_user,
    group   => $::pg_monz::zabbix_group,
    mode    => "0600",
    content => template("pg_monz/pgsql_funcs.conf.erb"),
  } ->

  file { "/etc/pg_monz/pgpool_funcs.conf" :
    ensure  => present,
    owner   => $::pg_monz::zabbix_user,
    group   => $::pg_monz::zabbix_group,
    mode    => "0600",
    content => template("pg_monz/pgpool_funcs.conf.erb"),
  }

  $data = $::pg_monz::userparameters
    
  file { '/etc/zabbix/zabbix_agentd.d/userparameter_pg_monz.conf' :
    ensure  => present,
    owner   => $::pg_monz::zabbix_user,
    group   => $::pg_monz::zabbix_group,
    mode    => '0640',
    content => template('pg_monz/userparameter_pg_monz.conf.erb'),
    require => Staging::Extract["pg_monz-${::pg_monz::version}.tar.gz"],
  } ->

  exec { "zabbix-agent-reload":
    command => "/etc/init.d/zabbix-agent reload",
    user    => "root",
  }

  
  

}

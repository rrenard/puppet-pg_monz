# == Class pg_monz::config
#
# This class is called from pg_monz for configuring pg_monz.
#
class pg_monz::config {

  file { '/etc/pg_monz/pgsql_funcs.conf' :
    ensure  => present,
    owner   => $::pg_monz::zabbix_user,
    group   => $::pg_monz::zabbix_group,
    mode    => '0600',
    content => template('pg_monz/pgsql_funcs.conf.erb'),
    require => File['/etc/pg_monz'],
  }

  file { '/etc/pg_monz/pgpool_funcs.conf' :
    ensure  => present,
    owner   => $::pg_monz::zabbix_user,
    group   => $::pg_monz::zabbix_group,
    mode    => '0600',
    content => template('pg_monz/pgpool_funcs.conf.erb'),
    require => File['/etc/pg_monz'],
  }

  $cmd_pfx = $::pg_monz::userparameters_cmd_prefix
  $data = $::pg_monz::userparameters
    
  file { "$::pg_monz::userparameters_dir/userparameter_pg_monz.conf" :
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('pg_monz/userparameter_pg_monz.conf.erb'),
    require => Archive["$::pg_monz::install_dir/pg_monz-${::pg_monz::version}.tar.gz"],
  }

}

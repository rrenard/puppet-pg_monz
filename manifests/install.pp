# == Class pg_monz::install
#
# This class is called from pg_monz for install.
#
class pg_monz::install {

  file { $::pg_monz::install_dir :
    ensure => directory,
    owner  => $::pg_monz::zabbix_user,
    group  => $::pg_monz::zabbix_group,
    mode   => '0750',
  } ->
      
  staging::file { "pg_monz-${::pg_monz::version}.tar.gz":
    source => "${::pg_monz::download_url}/${::pg_monz::version}.tar.gz",
  } ->

  staging::extract { "pg_monz-${::pg_monz::version}.tar.gz":
    target  => $::pg_monz::install_dir,
    creates => "${::pg_monz::install_dir}/pg_monz-${::pg_monz::version}/LICENSE",
    user    => $::pg_monz::zabbix_user,
    group   => $::pg_monz::zabbix_group,
  } ->

  file { '/usr/local/bin/pg_monz' :
    ensure => link,
    owner  => $::pg_monz::zabbix_user,
    group  => $::pg_monz::zabbix_group,
    target => "${::pg_monz::install_dir}/pg_monz-${::pg_monz::version}/pg_monz/usr-local-bin",
  } ->

  file { '/etc/pg_monz' :
    ensure => directory,
    owner  => $::pg_monz::zabbix_user,
    group  => $::pg_monz::zabbix_group,
    mode   => '0750',
  } 

}

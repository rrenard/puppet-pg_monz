# == Class pg_monz::params
#
# This class is meant to be called from pg_monz.
# It sets variables according to platform.
#
class pg_monz::params {

  # Common settings
  $version = '2.1'
  $install_dir = '/opt/pg_monz'
  $download_url = 'https://github.com/pg-monz/pg_monz/archive'
  $zabbix_user = 'zabbix'
  $zabbix_group = 'zabbix'
  $config_user = 'zabbix'
  $config_group = 'zabbix'

  # PGSQL settings
  $pghost = 'localhost'
  $pgport = 5432
  $pgrole = 'postgres'
  $pgdatabase = 'postgres'

  #PGPOOL settings
  $pgpoolhost = 'localhost'
  $pgpoolport = 9999
  $pgpoolrole = 'postgres'
  $pgpooldatabase = 'postgres'
  $pgpoolconf = '/etc/pgpool/pgpool.conf'

  # User parameters
  if $::osfamily == 'Debian' {
    $userparameters_dir = '/etc/zabbix/zabbix_agentd.conf.d'
  } else {
    $userparameters_dir = '/etc/zabbix/zabbix_agentd.d'
  }
  $userparameters_cmd_prefix = ''
  $userparameters = 'UNSET'
}

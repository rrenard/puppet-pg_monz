# Class: pg_monz
# ===========================
#
# Full description of class pg_monz here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class pg_monz (

  $version = $::pg_monz::params::version,
  $install_dir = $::pg_monz::params::install_dir,
  $download_url = $::pg_monz::params::download_url,
  $zabbix_user = $::pg_monz::params::zabbix_user,
  $zabbix_group = $::pg_monz::params::zabbix_group,
  $config_user = $::pg_monz::params::config_user,
  $config_group = $::pg_monz::params::config_group,
  $pghost = $::pg_monz::params::pghost,
  $pgport = $::pg_monz::params::pgport,
  $pgrole = $::pg_monz::params::pgrole,
  $pgdatabase = $::pg_monz::params::pgdatabase,
  $pgpoolhost = $::pg_monz::params::pgpoolhost,
  $pgpoolport = $::pg_monz::params::pgpoolport,
  $pgpoolrole = $::pg_monz::params::pgpoolrole,
  $pgpooldatabase = $::pg_monz::params::pgpooldatabase,
  $pgpoolconf = $::pg_monz::params::pgpoolconf,
  $userparameters_dir = $::pg_monz::params::userparameters_dir,
  $userparameters_cmd_prefix = $::pg_monz::params::userparameters_cmd_prefix,
  $userparameters = $::pg_monz::params::userparameters,

) inherits ::pg_monz::params {

  # validate parameters here

  
  class { '::pg_monz::install': } ->
  class { '::pg_monz::config': } ~>
  class { '::pg_monz::service': } ->
  Class['::pg_monz']
}

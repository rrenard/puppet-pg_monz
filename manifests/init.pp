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

  $version = $::pg_monz::version,
  $install_dir = $::pg_monz::install_dir,
  $download_url = $::pg_monz::download_url,
  $zabbix_user = $::pg_monz::zabbix_user,
  $zabbix_group = $::pg_monz::zabbix_group,
  $pghost = $::pg_monz::pghost,
  $pgport = $::pg_monz::pgport,
  $pgrole = $::pg_monz::pgrole,
  $pgdatabase = $::pg_monz::pgdatabase,
  $pgpoolhost = $::pg_monz::pgpoolhost,
  $pgpoolport = $::pg_monz::pgpoolport,
  $pgpoolrole = $::pg_monz::pgpoolrole,
  $pgpooldatabase = $::pg_monz::pgpooldatabase,
  $pgpoolconf = $::pg_monz::pgpoolconf,
  $userparameters_dir = $::pg_monz::userparameters_dir,
  $userparameters_cmd_prefix = $::pg_monz::userparameters_cmd_prefix,
  $userparameters = $::pg_monz::userparameters,

) inherits ::pg_monz::params {

  # validate parameters here

  
  class { '::pg_monz::install': } ->
  class { '::pg_monz::config': } ~>
  class { '::pg_monz::service': } ->
  Class['::pg_monz']
}

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
  $package_name = $::pg_monz::params::package_name,
  $service_name = $::pg_monz::params::service_name,
) inherits ::pg_monz::params {

  # validate parameters here

  class { '::pg_monz::install': } ->
  class { '::pg_monz::config': } ~>
  class { '::pg_monz::service': } ->
  Class['::pg_monz']
}

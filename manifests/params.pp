# == Class pg_monz::params
#
# This class is meant to be called from pg_monz.
# It sets variables according to platform.
#
class pg_monz::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'pg_monz'
      $service_name = 'pg_monz'
    }
    'RedHat', 'Amazon': {
      $package_name = 'pg_monz'
      $service_name = 'pg_monz'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}

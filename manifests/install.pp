# == Class pg_monz::install
#
# This class is called from pg_monz for install.
#
class pg_monz::install {

  package { $::pg_monz::package_name:
    ensure => present,
  }
}

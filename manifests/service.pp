# == Class pg_monz::service
#
# This class is meant to be called from pg_monz.
# It ensure the service is running.
#
class pg_monz::service {

  service { $::pg_monz::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}

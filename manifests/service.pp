# == Class pg_monz::service
#
# This class is called from pg_monz for configuring pg_monz.
#
class pg_monz::service {

  exec { 'zabbix-agent-reload':
    command     => '/etc/init.d/zabbix-agent restart',
    user        => 'root',
    refreshonly => true,
    subscribe   => File['/etc/zabbix/zabbix_agentd.d/userparameter_pg_monz.conf'],
  }

}


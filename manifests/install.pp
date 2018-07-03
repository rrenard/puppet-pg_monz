# == Class pg_monz::install
#
# This class is called from pg_monz for install.
#
class pg_monz::install {

  file { $::pg_monz::install_dir :
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  } ->

  archive { "$::pg_monz::install_dir/pg_monz-${::pg_monz::version}.tar.gz":
    source       => "${::pg_monz::download_url}/${::pg_monz::version}.tar.gz",
    extract      => true,
    extract_path => $::pg_monz::install_dir,
    creates      => "${::pg_monz::install_dir}/pg_monz-${::pg_monz::version}/LICENSE",
    user         => 'root',
    group        => 'root',
  } ->

  file { '/usr/local/bin/pg_monz' :
    ensure => link,
    owner  => 'root',
    group  => 'root',
    target => "${::pg_monz::install_dir}/pg_monz-${::pg_monz::version}/pg_monz/usr-local-bin",
  } ->

  file { '/etc/pg_monz' :
    ensure => directory,
    owner  => $::pg_monz::config_user,
    group  => $::pg_monz::config_group,
    mode   => '0750',
  }

}

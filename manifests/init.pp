# == Class: splunkforwarder
#
# Module to manage splunkforwarder
#

class splunkforwarder
(
  $install_source           = 'C:/splunkforwarder-6.1.1-207789-x64-release.msi',
  $deployment_server        = "splunk.${::domain}",
  $deployment_server_port   = '9997',
  $deployment_client_config = 'C:/Program Files/SplunkUniversalForwarder/etc/system/local/deploymentclient.conf',
  $inputs_config            = 'C:/Program Files/SplunkUniversalForwarder/etc/system/local/inputs.conf',
  $server_config            = 'C:/Program Files/SplunkUniversalForwarder/etc/system/local/server.conf',
) {

  package { 'universalforwarder':
    source          => $install_source,
    install_options => {
      'AGREETOLICENSE'         => 'Yes',
      'DEPLOYMENT_SERVER'      => "${::deployment_server}:${::deployment_server_port}",
      'LAUNCHSPLUNK'           => 1,
      'SERVICESTARTTYPE'       => 'auto',
  }
  }
  file { 'deploymentclient':
    ensure   => present,
    path     => $deployment_client_config,
    mode     => '0700',
    content  => template('splunkforwarder/deploymentserver.erb'),
    require  => Package['universalforwarder'],
    notify   => Service['splunkforwarder'],
  }
  service { 'splunkforwarder':
    ensure  => running,
    enable  => true,
    require => Package['universalforwarder'],
  }
  ini_setting { 'inputsconf_fqdn':
    ensure  => present,
    path    => $inputs_config,
    section => 'default',
    setting => 'host',
    value   => $fqdn,
    notify  => Service['splunkforwarder'],
    require => Package['universalforwarder'],
  }
  ini_setting { 'serverconf_fqdn':
    ensure  => present,
    path    => $server_config,
    section => 'general',
    setting => 'serverName',
    value   => $fqdn,
    notify  => Service['splunkforwarder'],
    require => Package['universalforwarder'],
  }
  }

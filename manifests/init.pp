# == Class: splunkforwarder
#
# Module to manage splunkforwarder
#

class splunkforwarder
(
  $install_source          = 'undef',
  $deployment_server       = "splunk.${::domain}",
  $deployment_server_port  = '9997',
  $deploymentclient_config = 'undef'
) {

 package {'universalforwarder':
    source          => "${::install_source}",
    install_options => {
      'AGREETOLICENSE'         => 'Yes',
      'DEPLOYMENT_SERVER'      => "${::deployment_server}:${::deployment_server_port}",
      'LAUNCHSPLUNK'           => "1",
      'SERVICESTARTTYPE'       => "auto",
  }
  }
  file { 'deploymentserver':
    ensure   => present,
    path     => "${::deploymentclient_config}",
    mode     => '0700',
    content  => template('splunkforwarder/deploymentserver.erb'),
    require  => Package['universalforwarder'],
    notify   => Service['splunkforwarder'],
  }
  service {'splunkforwarder':
    ensure  => running,
    enable  => true,
    require => Package['universalforwarder'],
  }
  ini_setting { 'inputsconf_fqdn':
    ensure  => present,
    path    => 'C:/Program Files/SplunkUniversalForwarder/etc/system/local/inputs.conf',
    section => 'default',
    setting => 'host',
    value   => $fqdn,
  }
  ini_setting { 'serverconf_fqdn':
    ensure  => present,
    path    => 'C:/Program Files/SplunkUniversalForwarder/etc/system/local/server.conf',
    section => 'general',
    setting => 'serverName',
    value   => $fqdn,
  }
  }
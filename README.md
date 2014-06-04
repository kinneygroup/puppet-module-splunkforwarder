# puppet-module-splunkforwarder

Puppet module to install and configure Splunk Universal Forwarder

===

# Compatability

This module has been tested to work on the following systems with Puppet v3 and Ruby versions 1.8.7, 1.9.3 and 2.0.0.

 * Windows Server 2008 R2

===

# Parameters

install_source
-----------
Path to Splunk Universal Forwarder .msi file for installation.

- *Default*: 'undef

deployment_server
---------------------------
Hostname or IP Address of the Splunk deployment server used to remotely configure Splunk forwarders.

- *Default*: "splunk.${::domain}"

deployment_server_port
---------------
The TCP port used to communicate with the Slunk deployment server.

- *Default*: '9997'

deployment_client_config
---------------------------
Deployment client configuration file, stores Splunk deployment server settings.

- *Default*: 'C:/Program Filest/SplunkUniversalForwarder/etc/system/local/deploymentclient.conf'

inputs_config
-------------
Splunk forwarder monitoring inputs.

- *Default*: 'C:/Program Files/SplunkUniversalForwarder/etc/system/local/inputs.conf'

server_config
-------------
Splunk forwarder configuration file.

- *Default*: 'C:/Program Files/SplunkUniversalForwarder/etc/system/local/server.conf'
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

- *Default*: false

deployment_server
---------------------------
Hostname or IP Address of the Splunk deployment server used to remotely configure Splunk forwarders.

- *Default*: "splunk.${::domain}"

deployment_server_port
---------------
The TCP port used to communicate with the Slunk deployment server.

- *Default*: '9997'
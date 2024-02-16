##############################################################################
# Consul Configuration File
# This file is intended to manage the configuration of Consul.
# For more information on Consul configuration files, visit:
# https://developer.hashicorp.com/consul/docs/agent/config/config-files
##############################################################################

# Address that Consul will bind to for client interfaces
# Use 0.0.0.0 to bind to all available network interfaces
bind_addr = "127.0.0.1"

# Data directory where Consul will store its state, such as key-value data, service catalog, etc.
data_dir = "/var/lib/consul"

# Addresses of agents to join the cluster upon start-up
# Multiple addresses can be specified, Consul will attempt to join each one sequentially
# retry_join = ["192.168.1.10", "192.168.1.11", "192.168.1.12"]

# Disable remote access to the Consul API
disable_remote_exec = true
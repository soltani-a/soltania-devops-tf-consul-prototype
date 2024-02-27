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

# Parameter to enable UI
ui_config{
    enabled = true
}
# Ports used by Consul server
ports{
    dns = 8600
    http = 8500 
    https = -1
    grpc = 8502 # -1 per default on server mode, 8502 per default on dev mode
    #grpc_tls = 8503 
    serf_lan = 8301
    serf_wan = 8302
    server = 8300
}

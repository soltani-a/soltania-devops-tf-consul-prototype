#!/bin/bash
consul -version

# Start Consul in the background with memory or development mode
if [ "$1" == "memory" ]; then
    consul agent -dev -server -log-level=info &
elif [ "$1" == "dev" ]; then
    consul agent -dev -log-level=info &
else
    echo "Usage: $0 [memory|dev]"
    exit 1
fi

# Wait for Consul to start completely
sleep 3

# Add example key-value pairs
consul kv put example/key1 value1
consul kv put example/key2 value2
consul kv put example/key3 value3

echo "Consul started successfully in the background."

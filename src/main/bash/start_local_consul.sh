#!/bin/bash
consul -version

# Start Consul in the background with memory or development mode
if [ "$1" == "memory" ]; then
    consul agent -dev -server -log-level=info &
elif [ "$1" == "dev" ]; then
    consul agent -dev -config-dir "../resources" -log-level=info &
else
    echo "Usage: $0 [memory|dev]"
    exit 1
fi

# Wait for Consul to start completely
sleep 3

echo "Consul started successfully in the background."

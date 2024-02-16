#!/bin/bash
consul -version

# Start Consul in the background with memory or development mode
if [ "$1" == "memory" ]; then
    consul agent -dev -client=0.0.0.0 -server -log-level=info &
elif [ "$1" == "dev" ]; then
    consul agent -dev -client=0.0.0.0 -log-level=info &
else
    echo "Usage: $0 [memory|dev]"
    exit 1
fi

echo "Consul started successfully in the background."

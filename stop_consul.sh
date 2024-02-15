#!/bin/bash

# Trouver le PID du processus Consul en cours d'exécution, en excluant le script lui-même
consul_pid=$(ps aux | grep "consul" | grep -v grep | grep -v "$0" | awk '{print $1}')

# Vérifier si Consul est en cours d'exécution
if [ -z "$consul_pid" ]; then
    echo "Consul is not running."
    exit 1
fi

# Arrêter Consul en envoyant un signal SIGINT
kill -SIGINT $consul_pid

echo "Consul stopped successfully."

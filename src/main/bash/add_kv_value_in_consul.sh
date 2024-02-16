# Wait for Consul to start completely
sleep 3

# Add example key-value pairs
consul kv put example/key1 value1
consul kv put example/key2 value2
consul kv put example/key3 value3

echo "KV values has been successfully added."

# Configure the Consul provider
provider "consul" {
  address    = "127.0.0.1:8500"
  datacenter = "dc1"
}
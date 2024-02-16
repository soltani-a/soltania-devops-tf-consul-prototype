resource "consul_keys" "app" {
  datacenter = "dc1"

  key {
    path  = "example2/key1"
    value = "value1"
  }

  key {
    path  = "example2/key2"
    value = "value1"
  }

  key {
    path  = "example2/key3"
    value = "value1"
  }
}
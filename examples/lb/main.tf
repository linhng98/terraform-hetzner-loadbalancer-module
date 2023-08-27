resource "hcloud_network" "mynet" {
  name     = "my-net"
  ip_range = "10.10.0.0/16"
}

resource "hcloud_network_subnet" "foonet" {
  network_id   = hcloud_network.mynet.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.10.0.0/24"
}

module "lb" {
  source = "../.."

  name      = "example-lb"
  location  = "fsn1"
  subnet_id = hcloud_network_subnet.foonet.id
  ip        = "10.10.0.2"
  service_configs = [
    {
      protocol         = "tcp"
      listen_port      = 80
      destination_port = 30080
    },
    {
      protocol         = "tcp"
      listen_port      = 443
      destination_port = 30443
    },
  ]
  label_selector = "pool=agent"
}

resource "hcloud_load_balancer" "lb" {
  name               = var.name
  load_balancer_type = var.load_balancer_type
  location           = var.location
  delete_protection  = var.delete_protection

  algorithm {
    type = var.algorithm
  }
  labels = var.labels
}

resource "hcloud_load_balancer_network" "lb_network" {
  load_balancer_id        = hcloud_load_balancer.lb.id
  subnet_id               = var.subnet_id
  enable_public_interface = var.enable_public_interface
}

resource "hcloud_load_balancer_service" "lb_service" {
  load_balancer_id = hcloud_load_balancer.lb.id
  protocol         = var.protocol
  listen_port      = var.listen_port
  destination_port = var.destination_port
  proxyprotocol    = var.proxyprotocol
  dynamic "http" {
    for_each = var.http_configs
    content {
      sticky_sessions = http.value["sticky_sessions"]
      cookie_name     = http.value["cookie_name"]
      cookie_lifetime = http.value["cookie_lifetime"]
      certificates    = http.value["certificates"]
      redirect_http   = http.value["redirect_http"]
    }
  }

  dynamic "health_check" {
    for_each = var.health_check_configs
    content {
      protocol = health_check.value["protocol"]
      port     = health_check.value["port"]
      interval = health_check.value["interval"]
      timeout  = health_check.value["timeout"]
      retries  = health_check.value["retries"]

      dynamic "http" {
        for_each = health_check.value["http_configs"]
        content {
          domain       = http.value["domain"]
          path         = http.value["path"]
          response     = http.value["response"]
          tls          = http.value["tls"]
          status_codes = http.value["status_codes"]
        }
      }
    }
  }
}

resource "hcloud_load_balancer_target" "lb_target" {
  type             = "label_selector"
  load_balancer_id = hcloud_load_balancer.lb.id
  label_selector   = var.label_selector
}

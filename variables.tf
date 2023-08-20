variable "name" {
  description = "Name of the Load Balancer."
  type        = string
}

variable "load_balancer_type" {
  description = "Type of the Load Balancer."
  type        = string
  default     = "lb11"
}

variable "location" {
  description = "The location name of the Load Balancer. Require when no network_zone is set."
  type        = string
}

variable "algorithm" {
  description = "Configuration of the algorithm the Load Balancer use."
  type        = string
  default     = "round_robin"
}

variable "delete_protection" {
  description = "Enable or disable delete protection."
  type        = bool
  default     = false
}

variable "subnet_id" {
  description = "ID of the sub-network which should be added to the Load Balancer."
  type        = string
}

variable "enable_public_interface" {
  description = "Enable or disable the Load Balancers public interface."
  type        = bool
  default     = true
}

variable "protocol" {
  description = "Protocol of the service. http, https or tcp"
  type        = string
}

variable "listen_port" {
  description = "Port the service listen on, required if protocol is tcp. Can be everything between 1 and 65535. Must be unique per Load Balancer."
  type        = number
}

variable "destination_port" {
  description = "Port the service connects to the targets on, required if protocol is tcp. Can be everything between 1 and 65535."
  type        = number
}

variable "proxyprotocol" {
  description = "Enable proxyprotocol."
  type        = bool
  default     = false
}

variable "http_configs" {
  description = "List of http configurations when protocol is http or https."
  type = list(object({
    sticky_sessions = optional(bool, false)
    cookie_name     = optional(string)
    cookie_lifetime = optional(number)
    certificates    = optional(list(string))
    redirect_http   = optional(bool)
  }))
  default = []
}

variable "health_check_configs" {
  description = "List of health check configurations."
  type = list(object({
    protocol = string
    port     = number
    interval = number
    timeout  = number
    retries  = optional(number, 10)

    http_configs = optional(list(object({
      domain       = optional(string)
      path         = string
      response     = optional(string)
      tls          = optional(bool, true)
      status_codes = optional(list(string), ["200"])
    })), [])
  }))
  default = []
}

variable "label_selector" {
  description = "Label Selector selecting targets for this Load Balancer."
  type        = string
}

variable "labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type        = map(string)
  default     = {}
}

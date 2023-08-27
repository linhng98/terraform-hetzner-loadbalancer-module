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

variable "ip" {
  description = "IP address of this LB."
  type        = string
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

variable "service_configs" {
  description = "List service port and healthcheck config."
  type = list(object({
    protocol         = string
    listen_port      = number
    destination_port = number
    proxyprotocol    = optional(bool, false)
    http_configs = optional(list(object({
      sticky_sessions = optional(bool, false)
      cookie_name     = optional(string)
      cookie_lifetime = optional(number)
      certificates    = optional(list(string))
      redirect_http   = optional(bool)
    })), [])
    health_check_configs = optional(list(object({
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

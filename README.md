## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.42.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.42.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_load_balancer.lb](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/load_balancer) | resource |
| [hcloud_load_balancer_network.lb_network](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/load_balancer_network) | resource |
| [hcloud_load_balancer_service.lb_service](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/load_balancer_service) | resource |
| [hcloud_load_balancer_target.lb_target](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/load_balancer_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_algorithm"></a> [algorithm](#input\_algorithm) | Configuration of the algorithm the Load Balancer use. | `string` | `"round_robin"` | no |
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Enable or disable delete protection. | `bool` | `false` | no |
| <a name="input_enable_public_interface"></a> [enable\_public\_interface](#input\_enable\_public\_interface) | Enable or disable the Load Balancers public interface. | `bool` | `true` | no |
| <a name="input_ip"></a> [ip](#input\_ip) | IP address of this LB. | `string` | n/a | yes |
| <a name="input_label_selector"></a> [label\_selector](#input\_label\_selector) | Label Selector selecting targets for this Load Balancer. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | User-defined labels (key-value pairs) should be created with. | `map(string)` | `{}` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | Type of the Load Balancer. | `string` | `"lb11"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location name of the Load Balancer. Require when no network\_zone is set. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Load Balancer. | `string` | n/a | yes |
| <a name="input_service_configs"></a> [service\_configs](#input\_service\_configs) | List service port and healthcheck config. | <pre>list(object({<br>    protocol         = string<br>    listen_port      = number<br>    destination_port = number<br>    proxyprotocol    = optional(bool, false)<br>    http_configs = optional(list(object({<br>      sticky_sessions = optional(bool, false)<br>      cookie_name     = optional(string)<br>      cookie_lifetime = optional(number)<br>      certificates    = optional(list(string))<br>      redirect_http   = optional(bool)<br>    })), [])<br>    health_check_configs = optional(list(object({<br>      protocol = string<br>      port     = number<br>      interval = number<br>      timeout  = number<br>      retries  = optional(number, 10)<br><br>      http_configs = optional(list(object({<br>        domain       = optional(string)<br>        path         = string<br>        response     = optional(string)<br>        tls          = optional(bool, true)<br>        status_codes = optional(list(string), ["200"])<br>      })), [])<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID of the sub-network which should be added to the Load Balancer. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of this loadbalancer |
| <a name="output_ipv4"></a> [ipv4](#output\_ipv4) | IPV4 of this loadbalancer |
| <a name="output_labels"></a> [labels](#output\_labels) | Resource labels |
| <a name="output_location"></a> [location](#output\_location) | Location of this loadbalancer |
| <a name="output_name"></a> [name](#output\_name) | Name of this loadbalancer |

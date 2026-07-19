# terraform-google-vpc

Terraform module that manages a [Google Cloud](https://cloud.google.com/)
VPC network (`google_compute_network`). It creates a single custom-mode network
and exposes its self link so companion modules (subnets, firewall, routers) can
build on top of it.

## Usage

```hcl
module "vpc" {
  source = "github.com/moveeeax/terraform-google-vpc"

  project_id              = var.project_id
  name                    = "prod-vpc"
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = false
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| google    | >= 5.0   |

## Inputs

| Name                              | Description                                                          | Type     | Default      | Required |
|-----------------------------------|----------------------------------------------------------------------|----------|--------------|:--------:|
| `project_id`                      | ID of the project in which to create the VPC network.                | `string` | n/a          |   yes    |
| `name`                            | Name of the VPC network.                                             | `string` | n/a          |   yes    |
| `routing_mode`                    | Network-wide routing mode: REGIONAL or GLOBAL.                       | `string` | `"REGIONAL"` |    no    |
| `auto_create_subnetworks`         | Whether to create a subnetwork in every region automatically.       | `bool`   | `false`      |    no    |
| `mtu`                             | Maximum transmission unit in bytes, between 1300 and 8896.          | `number` | `1460`       |    no    |
| `delete_default_routes_on_create` | Whether to delete the default internet routes on creation.          | `bool`   | `false`      |    no    |
| `description`                     | Optional description for the VPC network.                           | `string` | `null`       |    no    |

## Outputs

| Name           | Description                                              |
|----------------|----------------------------------------------------------|
| `id`           | Identifier of the VPC network.                          |
| `self_link`    | URI of the VPC network.                                 |
| `name`         | Name of the VPC network.                                |
| `gateway_ipv4` | IPv4 address of the gateway of the default route.       |

## License

[MIT](LICENSE)

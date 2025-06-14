# stdemo001

Este repositorio servirá de soporte a los posts en [Medium](https://medium.com/@jamieynonan) sobre Terraform e IaC.

| Post | Branch |
|------|--------|
| [Escalando IaC en tu Organización: Del Módulo al Template de Despliegue con GitHub Actions](https://medium.com/@jamieynonan/escalando-iac-en-tu-organizacion-del-modulo-al-template-de-despliegue-con-github-actions-d582a21b1d68) | master |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.10 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>4.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_module_name"></a> [module\_name](#module\_module\_name) | git::https://github.com/{owner}/{repo}.git | v1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group.<br/>  It must consist of lowercase letters and numbers, and have a length between 3 and 63 characters.<br/><br/>  Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
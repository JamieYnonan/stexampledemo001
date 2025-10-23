package policy.azure.storage

# Estas políticas esperan como input el JSON de `terraform show -json`,
# es decir, el tfplan nativo (input.resource_changes).

###############################################################################
# Helpers
###############################################################################

# Devuelve todos los resource_changes de un tipo dado
resource_changes_for(type) := [rc |
  rc := input.resource_changes[_]
  rc.type == type
]

# Obtiene el "after" planeado (o {} si es destroy)
after(rc) := v {
  v := rc.change.after
} else := v {
  v := {}
}

# https only habilitado
https_only_enabled(v) {
  v.https_traffic_only_enabled == true
}

# Consideramos "privada" si:
#  - public_network_access_enabled == false  (preferido)
is_private_storage_account(v) {
  v.public_network_access_enabled == false
}

###############################################################################
# Reglas para azurerm_storage_account
###############################################################################

deny[msg] {
  rc := resource_changes_for("azurerm_storage_account")[_]
  v  := after(rc)

  not is_private_storage_account(v)

  name := rc.name
  msg := sprintf("azurerm_storage_account[%q]: debe ser privada. Configura public_network_access_enabled=false o network_rules.default_action=\"Deny\".", [name])
}

deny[msg] {
  rc := resource_changes_for("azurerm_storage_account")[_]
  v  := after(rc)

  not v.allow_nested_items_to_be_public == false

  name := rc.name
  msg := sprintf("azurerm_storage_account[%q]: allow_nested_items_to_be_public debe ser false.", [name])
}

deny[msg] {
  rc := resource_changes_for("azurerm_storage_account")[_]
  v  := after(rc)

  not v.shared_access_key_enabled == false

  name := rc.name
  msg := sprintf("azurerm_storage_account[%q]: shared_access_key_enabled debe ser false (deshabilita Shared Key).", [name])
}

deny[msg] {
  rc := resource_changes_for("azurerm_storage_account")[_]
  v  := after(rc)

  not https_only_enabled(v)

  name := rc.name
  msg := sprintf("azurerm_storage_account[%q]: https_traffic_only_enabled debe ser true.", [name])
}

###############################################################################
# Reglas para azurerm_storage_container
###############################################################################

deny[msg] {
  rc := resource_changes_for("azurerm_storage_container")[_]
  v  := after(rc)

  # Si el campo viene (no-null), debe ser "private".
  v.container_access_type != null
  v.container_access_type != "private"

  name := rc.name
  msg := sprintf("azurerm_storage_container[%q]: container_access_type debe ser \"private\" (no público).", [name])
}

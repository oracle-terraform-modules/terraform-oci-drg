# Copyright (c) 2022 Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

output "drg_id" {
  description = "id of drg if it is created"
  value       = join(",", length(data.oci_core_drgs.drg_data.drgs) == 0 ? oci_core_drg.drg[*].id : data.oci_core_drgs.drg_data.drgs[*].id)
}

output "drg_display_name" {
  description = "display name of drg if it is created"
  value       = join(",", length(data.oci_core_drgs.drg_data.drgs) == 0 ? oci_core_drg.drg[*].display_name : data.oci_core_drgs.drg_data.drgs[*].display_name)
}

# Complete outputs for each resources with provider parity. Auto-updating.
# Useful for module composition.
output "drg_all_attributes" {
  description = "all attributes of created drg"
  value       = { for k, v in(length(data.oci_core_drgs.drg_data.drgs) == 0 ? oci_core_drg.drg[0] : data.oci_core_drgs.drg_data.drgs[0]) : k => v }
}

output "drg_attachment_all_attributes" {
  description = "all attributes related to drg attachment"
  value       = { for k, v in oci_core_drg_attachment.vcns : k => v }
}

output "drg_summary" {
  description = "drg information summary"
  value = {
    (length(data.oci_core_drgs.drg_data.drgs) == 0 ? oci_core_drg.drg[0].display_name : data.oci_core_drgs.drg_data.drgs[0].display_name) = {
      drg_id          = length(data.oci_core_drgs.drg_data.drgs) == 0 ? oci_core_drg.drg[0].id : data.oci_core_drgs.drg_data.drgs[0].id
      vcn_attachments = { for k, v in oci_core_drg_attachment.vcns : k => v.network_details[0].id }

    }
    "rpc" = {
      display_name = join(",", oci_core_remote_peering_connection.rpc[*].display_name)
      rpc_id       = join(",", oci_core_remote_peering_connection.rpc[*].id)
    }
  }
}


output "rpc_id" {
  description = "id of RPC if it is created"
  value       = join(",", oci_core_remote_peering_connection.rpc[*].id)
}

output "rpc_display_name" {
  description = "display name of RPC if it is created"
  value       = join(",", oci_core_remote_peering_connection.rpc[*].display_name)
}

output "rpc_all_attributes" {
  description = "all attributes of created RPC"
  value       = { for k, v in oci_core_remote_peering_connection.rpc : k => v }
}




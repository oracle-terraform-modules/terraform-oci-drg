# Copyright (c) 2022 Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl


resource "oci_core_drg" "drg" {
  compartment_id = var.compartment_id
  display_name   = var.label_prefix == "none" ? var.drg_display_name : "${var.label_prefix}-${var.drg_display_name}"

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags

  count = var.drg_id == null ? 1 : 0
}

data "oci_core_drgs" "drg_data" {
  compartment_id = var.compartment_id

  filter {
    name   = "id"
    values = [var.drg_id == null ? "none" : var.drg_id]
  }

}

resource "oci_core_drg_attachment" "vcns" {
  for_each     = var.drg_vcn_attachments != null ? var.drg_vcn_attachments : {}
  display_name = var.label_prefix == "none" ? "${var.drg_display_name}-to-${each.key}" : "${var.label_prefix}-${var.drg_display_name}-to-${each.key}"

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags

  drg_id = var.drg_id == null ? oci_core_drg.drg[0].id : var.drg_id

  network_details {
    id             = each.value.vcn_id                                                                          # required
    route_table_id = each.value.vcn_transit_routing_rt_id != null ? each.value.vcn_transit_routing_rt_id : null # optional. Only needed when using VCN Transit Routing or Network Appliance service chaining
    type           = "VCN"                                                                                      # Required
  }

  drg_route_table_id = each.value.drg_route_table_id != null ? each.value.drg_route_table_id : null # (Optional) (Updatable) string

  # * args not valid for attachment type VCN at the moment
  export_drg_route_distribution_id             = null  # (Optional) (Updatable) string
  remove_export_drg_route_distribution_trigger = false # (Optional) (Updatable) boolean
}

resource "oci_core_remote_peering_connection" "rpc" {

  compartment_id = var.compartment_id
  drg_id         = var.drg_id == null ? oci_core_drg.drg[0].id : var.drg_id
  display_name   = var.label_prefix == "none" ? "rpc_created_from_${var.drg_display_name}" : "${var.label_prefix}_rpc"

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags


  peer_id          = var.rpc_acceptor_id
  peer_region_name = var.rpc_acceptor_region

  count = var.create_rpc == true ? 1 : 0

}


# Terraform Dynamic Routing Gateway for Oracle Cloud Infrastructure

The Terraform DRG  for Oracle Cloud Infrastructure  provides a reusable Terraform module that provisions a minimal Dynamic Routing Gateway (DRG) on OCI.

It creates the following resources:

* A DRG attached to one or more customizable VCNs 
* An optional Remote Peering Gateway (RPC) internet gateway and a route table


This module is primarily meant to be reusable to create more advanced infrastructure on OCI either manually in the OCI Console or by extending the Terraform code.

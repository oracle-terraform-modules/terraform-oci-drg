---
name: "\U0001F41B Bug Report"
about: "If something isn't working as expected \U0001F914."
title: ''
labels: bug
assignees: ''

---

<!---
Please note the following potential times when an issue might be in Terraform core:

* [Configuration language](https://www.terraform.io/docs/configuration/index.html) or resource ordering issues
* [State](https://www.terraform.io/docs/state/index.html) and [state backend](https://www.terraform.io/docs/backends/index.html) issues
* [Provisioner](https://www.terraform.io/docs/provisioners/index.html) issues
* [Registry](https://registry.terraform.io/) issues
* Spans resources across multiple providers

If you are running into one of these scenarios, we recommend opening an issue in the [Terraform core repository](https://github.com/hashicorp/terraform/) instead.
--->

<!--- Please keep this note for the community --->

### Community note

* Please vote on this issue by adding a 👍 [reaction](https://blog.github.com/2016-03-10-add-reactions-to-pull-requests-issues-and-comments/) to the original issue to help the community and maintainers prioritize this request
* Please do not leave "+1" or "me too" comments, they generate extra noise for issue followers and do not help prioritize the request
* If you are interested in working on this issue or have submitted a pull request, please leave a comment

<!--- Thank you for keeping this note for the community --->

### Terraform and Oracle Cloud Infrastructure provider versions

<!--- Please run `terraform -v` to show the Terraform core version and provider version(s).
If you are using a local copy of the Oracle Cloud Infrastructure (OCI) provider for Terraform, run the plugin directly to get the version: `<path-to-plugin>/terraform-provider-oci`
If you are not running the latest version of Terraform or the provider, please upgrade because your issue may have already been fixed. [Terraform documentation on provider versioning](https://www.terraform.io/docs/configuration/providers.html#provider-versions). --->

### Affected Resource(s)

<!--- Please list the affected resources and data sources. For example, "oci_core_vcn". --->


### Terraform configuration files

<!--- Information about code formatting: https://help.github.com/articles/basic-writing-and-formatting-syntax/#quoting-code --->

```hcl
# Copy-paste your Terraform configurations here. For large Terraform configs,
# please use a service like Dropbox and share a link to an archive file (tar.gz or zip).
# Please remove any sensitive information from configuration files before sharing them.
```

### Debug output

<!---
Please provide a link to a GitHub Gist containing the complete debug output. Please do NOT paste the debug output in the issue; just paste a link to the Gist.

To obtain the debug output, see the [verbose logging for OCI Terraform Provider documentation].(https://www.terraform.io/docs/providers/oci/guides/troubleshooting.html#verbose-logging-for-oci-terraform-provider).

Github Gist: https://gist.github.com/
--->

### Panic output

<!---
If Terraform produced a panic, please provide a link to a GitHub Gist containing the output of the `crash.log`.

Github Gist: https://gist.github.com/
--->

### Expected behavior

<!--- What should have happened? --->

### Actual behavior

<!--- What actually happened? --->

### Steps to reproduce

<!--- Please list the steps required to reproduce the issue. --->

1. `terraform apply`

### Things we need to know

<!--- Is there anything atypical about your environment that we should know? For example: Is the issue specific to a region? --->

### References

<!---
Information about referencing Github Issues: https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests

Are there any other GitHub issues (open or closed) or pull requests that should be linked here? Vendor documentation? For example:
--->

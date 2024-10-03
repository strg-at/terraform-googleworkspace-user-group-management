<!-- markdownlint-disable MD041 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD028 -->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![pre-commit][pre-commit-shield]][pre-commit-url]
[![taskfile][taskfile-shield]][taskfile-url]
[![Terraform][terraform-shield]][terraform-url]

# Dynamic User- and Group Management for Google Workspace with Terraform

IAC Implementation for User- and Group Management in Google Workspace (formerly GSuite)

<details>
  <summary style="font-size:1.2em;">Table of Contents</summary>
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [How to use this module](#how-to-use-this-module)
  - [Authentication](#authentication)
- [How do I contribute to this module?](#how-do-i-contribute-to-this-module)
- [How is this module versioned?](#how-is-this-module-versioned)
- [License](#license)
- [Authors](#authors)
- [Terraform docs](#terraform-docs)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Modules](#modules)
  - [Resources](#resources)
  - [Inputs](#inputs)
  - [Outputs](#outputs)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>

## How to use this module

This module is published at Terraform Registry, see [Terraform Registry][tf-registry-module] for Details.

This repo has the following folder structure:

- [modules](modules/): This folder contains a set of modules for maintaining Users and Groups in Google Workspace.
- [examples](examples/): This folder shows examples on how to use this module with different data sources as well as an example for a data source and authentication with the Google API.

### Authentication

To maintain the Google Workspace ressources a Service account is needed. See [example-provider-authentication](examples/example-provider-authentication) for more information.

## How do I contribute to this module?

Contributions are very welcome! Please create a Pull Request.

## How is this module versioned?

This module uses [Semantic Versioning](http://semver.org/).

## License

This code is released under the MIT License. Please see [LICENSE](LICENSE) for more details.

## Authors

- **[Jasmin Müller](mailto:jasmin.mueller@strg.at)** (:octocat: [jazzlyn](https://github.com/jazzlyn)) - implementation

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

[tf-registry-module]: https://registry.terraform.io/modules/strg-at/user-group-management/googleworkspace

<!-- Badges -->

[pre-commit-shield]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&style=for-the-badge
[pre-commit-url]: https://github.com/pre-commit/pre-commit
[terraform-shield]: https://img.shields.io/badge/terraform-1.x-844fba?style=for-the-badge&logo=terraform
[terraform-url]: https://www.terraform.io/
[taskfile-url]: https://taskfile.dev/
[taskfile-shield]: https://img.shields.io/badge/Taskfile-Enabled-brightgreen?style=for-the-badge&logo=task

## Terraform docs

<!-- prettier-ignore-start -->
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_googleworkspace"></a> [googleworkspace](#requirement\_googleworkspace) | 0.7.0 |

### Providers

No providers.

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_group_settings"></a> [group\_settings](#module\_group\_settings) | ./modules/group_settings | n/a |
| <a name="module_groups"></a> [groups](#module\_groups) | ./modules/groups | n/a |
| <a name="module_groups_in_group"></a> [groups\_in\_group](#module\_groups\_in\_group) | ./modules/groups_in_group | n/a |
| <a name="module_users"></a> [users](#module\_users) | ./modules/users | n/a |
| <a name="module_users_external_to_groups"></a> [users\_external\_to\_groups](#module\_users\_external\_to\_groups) | ./modules/users_external_to_groups | n/a |
| <a name="module_users_to_groups"></a> [users\_to\_groups](#module\_users\_to\_groups) | ./modules/users_to_groups | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group_settings"></a> [group\_settings](#input\_group\_settings) | contains all defined group setting templates for Google Groups | <pre>map(object({<br>    allow_external_members : optional(bool),<br>    allow_web_posting : optional(bool),<br>    archive_only : optional(bool),<br>    enable_collaborative_inbox : optional(bool),<br>    include_in_global_address_list : optional(bool),<br>    is_archived : optional(bool),<br>    members_can_post_as_the_group : optional(bool),<br>    message_moderation_level : optional(string),<br>    reply_to : optional(string),<br>    spam_moderation_level : optional(string),<br>    who_can_assist_content : optional(string),<br>    who_can_contact_owner : optional(string),<br>    who_can_discover_group : optional(string),<br>    who_can_join : optional(string),<br>    who_can_leave_group : optional(string),<br>    who_can_moderate_content : optional(string),<br>    who_can_moderate_members : optional(string),<br>    who_can_post_message : optional(string),<br>    who_can_view_group : optional(string),<br>    who_can_view_membership : optional(string),<br>  }))</pre> | n/a | yes |
| <a name="input_groups"></a> [groups](#input\_groups) | contains objects representing all defined Google Groups | <pre>map(object({<br>    email : string,<br>    name : string,<br>    description : optional(string),<br>    settings : optional(string),<br>    aliases : optional(list(string)),<br>    members : optional(list(string)),<br>  }))</pre> | n/a | yes |
| <a name="input_users"></a> [users](#input\_users) | contains objects representing all defined Google Users | <pre>map(object({<br>    primary_email : string,<br>    given_name : string,<br>    family_name : string,<br>    password : optional(string),<br>    aliases : optional(list(string)),<br>    archived : optional(bool),<br>    include_in_global_address_list : optional(bool),<br>    ip_allowlist : optional(bool),<br>    is_admin : optional(bool),<br>    org_unit_path : optional(string),<br>    suspended : optional(bool),<br>    roles : optional(list(string)),<br>  }))</pre> | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | contains a given password required for Users | `string` | `null` | no |
| <a name="input_users_external"></a> [users\_external](#input\_users\_external) | contains objects representing all defined external Users | <pre>map(object({<br>    roles : list(string),<br>  }))</pre> | `{}` | no |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- prettier-ignore-end -->

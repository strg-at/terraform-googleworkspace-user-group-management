# Dynamic User- and Group Management for Google Workspace with Terraform
IAC Implementation for User- and Group Management in Google Workspace (formerly GSuite)

## How to use this module

This repo has the following folder structure:
* [modules](modules/): This folder contains a set of modules for maintaining Users and Groups in Google Workspace. The modules are basically standalone, however a proper data source is needed.
* [examples](examples/): This folder shows examples on how to use this module with different data sources as well as an example for a data source and authentication with the Google API.

### Google Cloud Service account

To maintain the Google Workspace ressources a Service account is needed. See [example-gsuite-authentication](examples/example-gsuite-authentication) on how to provide credentials to Terraform.

## How do I contribute to this module?

Contributions are very welcome! Please create a Pull Request.

## How is this module versioned?

This module uses [Semantic Versioning](http://semver.org/).

## License

This code is released under the MIT License. Please see [LICENSE](LICENSE) for more details.

## Authors

* **[Jasmin Müller](mailto:jasmin.mueller@strg.at)** (:octocat: [jazzlyn](https://github.com/jazzlyn)) - implementation

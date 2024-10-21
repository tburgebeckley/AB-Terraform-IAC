# 01-IAC-Platform-Language

* **Status** : [Pending]
* **Decision Makers** :  [tburgebeckley@gmai.com]
* **Decision Date** :  10/17/2024
* **Categories** : [Tools;IAC]

## Background and Issues

*The project requires a specific language of IAC management to ensure consistent performance and feature support. There are many products available, so selecting a platform and version will impact the availability of features to the development team.*

## Decision

*The platform selected will be Terraform. The version selected will be the current supported version, and subsequent sub minor releases, 1.9.x.*

## Advantages and Positive Impacts

* *This version and its subsequent fix sub versions will have the latest terraform features.*
* *This version will continue to have vulnerability and bug fix updates.*
* *This platform will leverage existing skills of the project team, and ensure easier contribution to the future of this project.*
* *As of right now, Terraform is FOSS, which allows the project team to leverage existing code repositories and team skills in an alternative to paying for licensing and support from HashiCorp.*

## Disadvantages and Negative Impacts

* *Pinning to this specific version will not have larger feature releases when a future minor version or major version is released.*
* *Other platforms, such as Terragrunt, Spacelift, OpenTofu, are all built upon Terraform. These potentially provide expanded functionality to the base layer of the Terraform platform that is unavailable to the base Terraform platform.*
* *HashiCorp recently changed their licensing to BSL, which allows them to be less community responsive, and potentially restrict source code at a future date. This could impact the ability of the team to react to new sub minor changes, or incur new cost to pay for support.*

## Other Options

* *SpaceLift could be a potential good option for larger projects, and it has a robust UI to allow easier adoption by less technical teams.*

## Useful Links

* HashiCorp Terraform: https://www.terraform.io/
* SpaceLift: https://spacelift.io
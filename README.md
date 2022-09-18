# terraform-walkthrough

This is a simple Terraform project used for a walkthrough to set up an AWS S3 bucket.

Feel free to use this to explore how to work with `terraform init`, `terraform plan` and `terraform apply`.

---

## Getting started

To make use of this setup you will need:
- Terraform installed in your OS [[Link](https://learn.hashicorp.com/tutorials/terraform/install-cli)]
- An IDE of your choice (I use [Visual Studio Code](https://code.visualstudio.com/) with the [Terraform Extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform))
- An AWS account
- An IAM user
  - Programmatic access for using access and secret keys
  - S3FullAccess permissions (The more restrictive the safer)
- Replace the access_key and secret_key values with your keys in `main.tf`
  - Remember to **never** share these keys publicly!
  - Replace these arguments for safer alternatives if you know what you are doing!

---

## What you can do

1. Run `terraform init` at root level

## Other commands to explore

- `terraform validate` - Validates HCL scripts without referencing the terraform state, essentially a syntax check
- `terraform refresh` - Updates state (which automatically runs with `plan` and `update` by default)
- `terraform init -upgrade` - Forces provider plugins to update to their latest versions, and overwrites the `.terraform.lock.hcl` terraform lockfile

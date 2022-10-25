# terraform-walkthrough

This is a simple Terraform project used for a walkthrough to set up an AWS S3 bucket.

Feel free to use this to explore how to work with `terraform init`, `terraform plan` and `terraform apply`.

---

## Getting started

To make use of this setup you will need:
- Terraform installed in your OS [[Instructions](https://learn.hashicorp.com/tutorials/terraform/install-cli)]
- An IDE of your choice (I use [Visual Studio Code](https://code.visualstudio.com/) with the [Terraform Extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform))
- An AWS account
- An IAM user
  - Programmatic access for using access and secret keys
  - S3FullAccess permissions (The more restrictive the safer)
- Set access_key and secret_key values located in `variables.tf` with your keys
  - Remember to **never** share these keys publicly!
  - You can either:
    - supply the values as arguments when prompted while running terraform commands
    - set the environment variables for the following:
      - TF_VAR_access_key
      - TF_VAR_secret_key

## What you can do

These were the steps I used to demonstrate the absolute basics, so feel free to explore Terraform in your own way, like adding additional services (be mindful of AWS billing charges, however.)

1. Run `terraform init` at root level
2. Run `terraform plan`
3. Run `terraform apply` to provision the S3 bucket
4. Change the bucket name in main.tf and save
5. Run `terraform plan` and `terraform apply` to update the infrastructure
6. Uncomment the other S3 bucket and S3 Object
7. Run `terraform plan` and `terraform apply` to add to the infrastructure
8. Delete the S3 Object or modify the S3 buckets to simulate changes
9. Run `terraform plan` and `terraform apply` to update the infrastructure
10. Delete everything by running `terraform destroy`


## Other commands to explore

- `terraform validate` - Validates HCL scripts without referencing the terraform state, essentially a syntax check
- `terraform refresh` - Updates state (which automatically runs with `plan` and `update` by default)
- `terraform init -upgrade` - Forces provider plugins to update to their latest versions, and overwrites the `.terraform.lock.hcl` terraform lockfile

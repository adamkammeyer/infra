# Proxy (terraform)

Copy templates/variables.tfvars.sample to an isolated directory (e.g., ~/.vault/secret.tfvars) and populate the varibles with the necessary values.

Copy templates/s3.sample to isolated directory and populate with the S3 credentials for the terraform state backend.  Update `shared_credentials_file` and `profile` in `main.tf` if necessary.

When executing `terraform`, provide the necessary var files as arguments

```
terraform apply -var-file=/home/user/.vault/secret.tfvars -var-file=non-secret.tfvars
```
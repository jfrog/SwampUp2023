# LAB 1 - Repository Provisioning using Terraform

## Prerequisites
- Lab-0 - Configure JFrog CLI or 
- Terraform CLI

<br />

## CREATE REPOSITORY using TERRAFORM
- cd  `JFTD103-JFrog_Platform_Automation/lab-1-Repository-Provisioning/terraform/`
- Initialize directory and pull down providers, 
  - run `terraform init`
- Format code per HCL canonical standard 
  - run `terraform fmt`
- Validate code for syntax
  - run `terraform validate`
- Output the deployment plan to `plan.out`
  - run `terraform plan -out plan.out`
    - Note: -out option to save this plan, so Terraform can guarantee to take exactly these actions if you run "terraform apply" now.
- Use the `plan.out` plan file to deploy 
  - run `terraform apply plan.out`


- To outputs a destroy plan
  - run `terraform plan -destroy`
- Destroy/cleanup deployment without being prompted for `yes`
  - run `terraform destroy --auto-approve`
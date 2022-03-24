# EKS TERRAFORM IMPLEMENTATION

## Requirements

* Terraform >= 1.0.11

## Custom VPC info

[here](https://github.com/bismarkcastilla/aws-vpc)

## Steps to configure credentials

First we need to configure our AWS credencials for that , we need to run:

```bash
$ aws configure
AWS Access Key ID [None]: xxxxxxxxxxxxxxxxx
AWS Secret Access Key [None]: xxxxxxxxxxxxxx
Default region name [None]: us-east-1
```

To validate your aws user , run this command:

```bash
aws sts get-caller-identity
```

Once your AWS profile/user is configure , the next step is to install the EKS cluster.

To install the EKS we need to initialize Terraform by running `terraform init`. Terraform will generate a directory named `.terraform` and download each module source declared in `main.tf`. Initialization will pull in any providers required by these modules.

```bash
$ terraform init
Initializing modules...
- eks in eks\modules\terraform-aws-eks
- eks.node_groups in eks\modules\terraform-aws-eks\modules\node_groups
- vpc in vpc\modules\terraform-aws-vpc

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/cloudinit...
- Finding hashicorp/aws versions matching "~> 3.0, >= 3.40.0, >= 3.43.0"...
- Finding hashicorp/kubernetes versions matching ">= 1.11.1"...
- Finding terraform-aws-modules/http versions matching ">= 2.4.1"...
- Finding hashicorp/local versions matching ">= 1.4.0"...
- Installing hashicorp/cloudinit v2.2.0...
- Installed hashicorp/cloudinit v2.2.0 (signed by HashiCorp)
- Installing hashicorp/aws v3.75.0...
- Installed hashicorp/aws v3.75.0 (signed by HashiCorp)
- Installing hashicorp/kubernetes v2.9.0...
- Installed hashicorp/kubernetes v2.9.0 (signed by HashiCorp)
- Installing terraform-aws-modules/http v2.4.1...
- Installed terraform-aws-modules/http v2.4.1 (self-signed, key ID B2C1C0641B6B0EB7)
- Installing hashicorp/local v2.2.2...
- Installed hashicorp/local v2.2.2 (signed by HashiCorp)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

After Terraform has been successfully initialized, run `terraform plan` to review what will be created:

After the plan is validated, apply the changes by running `terraform apply`. For one last validation step, Terraform will output the plan again and prompt for confirmation before applying. This step will take around 10-20 minutes to complete.

To connect to your cluster, run this command:

```bash
aws eks --region us-east-1 update-kubeconfig --name <eksclustername>
```

Next, run `kubectl get no` and you will see worker nodes from your cluster.

To destroy the cluster, run:

```bash
terraform destroy
```
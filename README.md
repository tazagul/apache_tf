Installing and launching an apache server hosted on AWS.

Acceptance criteria:
1. Download and extract the  latest release of the Terraform. 

[Download Terraform - Terraform by HashiCorp](https://www.terraform.io/downloads.html)

unzip terraform

2. You should have an AWS account credentials. 

Setup IAM access key and secret on your AWS account.

To login to your account run on your terminal aws configure

AWS Access Key ID [None]: EXAMPLE

AWS Secret Access Key [None]: EXAMPLEKEY

Default region name [None]: us-west-2

Default output format [None]: json


SOLUTION: 

1. provider.tf - A provider is responsible for understanding API interactions and exposing resources. 
2. key.tf - creates a key and stores it in the region you define in var.tf file. And it is used to connect to the created instance via ssh.
3. sg.tf - creates a security group to open ports 22, 80, and 443. 
Port  22 -Secure Shell (SSH) - used for secure logins. 
Port 80-Port 80 is the port number assigned to commonly used internet *communication* protocol, Hypertext Transfer Protocol (HTTP)
Port 443-*Port 443* is mainly used by web servers providing HTTPS (HTTP encrypted by SSL or TLS)
4. data_ami.tf - This data source is used to get the ID of a registered AMI for use in EC2 instance. 
5. ec2.tf - creates an ec2 instances, logs into the instance, installs, starts and enables the apache using provisioner.
6. Output.tf - gives you a public IP of your instance.
7. Var.tf - contains variables where to create an instance, the size of an instance and private/public key to login to the instance.

How to use this code:

1. Clone this repo
2. Edit the var.tf file
3. Run terraform init
4. Run terraform plan
5. Run terraform apply
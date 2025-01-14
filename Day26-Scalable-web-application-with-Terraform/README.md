# Day 26: Build a Scalable Web Application with Auto Scaling on AWS

This project demonstrates how to deploy  an AWS infrastructure that automatically scales based on demand, following best practices for scalability and maintainability.

## Features

- **Auto Scaling Group (ASG)**: Automatically scales EC2 instances based on demand.
- **Elastic Load Balancer (ELB)**: Distributes traffic across EC2 instances in multiple Availability Zones.
- **Launch Configuration**: Defines the EC2 instance properties such as instance type and AMI.
- **VPC & Subnets**: Uses AWS VPC and subnets for networking configuration.
- **Terraform Modules**: The infrastructure is modularized for easy management and reusability.


## Prerequisites

Before you begin, ensure you have met the following requirements:

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An AWS account with appropriate permissions (Administrator access or equivalent) to create the necessary resources.
- Basic understanding of AWS EC2, Auto Scaling, and Load Balancers.

# Terraform AWS Auto Scaling Group & Load Balancer Setup

This project uses Terraform to deploy and manage an infrastructure on AWS. The setup includes an Auto Scaling Group (ASG), Load Balancer (LB), EC2 instances, and other AWS resources to ensure high availability and scalability for a web application.

## Features

- **Auto Scaling Group (ASG)**: Automatically scales EC2 instances based on demand.
- **Elastic Load Balancer (ELB)**: Distributes traffic across EC2 instances in multiple Availability Zones.
- **Launch Configuration**: Defines the EC2 instance properties such as instance type and AMI.
- **VPC & Subnets**: Uses AWS VPC and subnets for networking configuration.
- **Terraform Modules**: The infrastructure is modularized for easy management and reusability.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An AWS account with appropriate permissions (Administrator access or equivalent) to create the necessary resources.
- AWS CLI installed and configured with your credentials.
- Basic understanding of AWS EC2, Auto Scaling, and Load Balancers.

## Project Structure

```bash
.
├── modules/
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── elb/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── asg/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── envs/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── backend.tf
├── provider.tf
└── variables.tf
```


## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/malachieborohoul/Day-26-Build-a-Scalable-Web-Application-with-Auto-Scaling-on-AWS
cd Day-26-Build-a-Scalable-Web-Application-with-Auto-Scaling-on-AWS
```
### 2. Initialize Terraform
```bash
cd envs/dev
terraform init
```


### 3. Customize Variables
Modify the terraform.tfvars file in /envs/dev/ to customize the following settings :

* aws_region: The AWS region where the resources will be deployed.
* instance_type: The EC2 instance type for the Auto Scaling Group.
* max_size: The maximum number of instances allowed in the ASG.
* min_size: The minimum number of instances in the ASG.
You can also  other parameters if needed.

### 4.  Review and Apply Changes
```bash
terraform plan
terraform apply
```
Terraform will display the changes that will be made. Type yes to confirm and proceed with the deployment.

<img src="/assets/yes.png" >
<br>
<br>
Once the infrastructure is deployed, you can access the Load Balancer’s DNS name via the output provided by Terraform.
<br>
<br>
<img src="/assets/output.png" >

### 4.  Cleanup
Don't forget to cleanup. To remove the infrastructure, run:
```bash
terraform destroy
```

### Contribution
Feel free to contribute by opening issues or submitting pull requests to improve the project.

### License
This project is licensed under the MIT License.

## Deploying a web server on AWS using Terraform

### Pre-requisites
At Random
- EC2 instance because that is the resource that will host the web server
- VPC
- Internet Gateway
- Security groups - port 22, tcp protocol
- User data. This will be a bash script that will:
        - Install apache web server
        - Check for updates
        - Retrieve the website files
        - start the web server
        - Keep it running

#### Files
- vpc.tf Has the IGW and SG 
- variables.tf
- userdata.sh
- output.tf
- ec2.tf

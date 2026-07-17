# Provision Scalable Three-Tier Web Application Infrastructure on AWS using Terraform

## Project Overview

This project provisions a scalable, highly available three-tier web application infrastructure on AWS using Infrastructure as Code (IaC) with Terraform.

The infrastructure follows AWS best practices by deploying the application across multiple Availability Zones, placing application servers behind an Application Load Balancer, using an Auto Scaling Group for scalability, and deploying a PostgreSQL RDS database in private subnets.


## Architecture

```
                    Internet
                        |
                Application Load Balancer
                        |
              Auto Scaling Group (EC2)
                        |
             Private PostgreSQL RDS Database

          VPC
     ┌───────────────────────────────┐
     │ Public Subnets (2 AZs)        │
     │  • ALB                        │
     │  • NAT Gateway                │
     │                               │
     │ Private Subnets (2 AZs)       │
     │  • EC2 Instances              │
     │  • PostgreSQL RDS             │
     └───────────────────────────────┘
```


## Features
- Infrastructure as Code using Terraform
- Custom VPC
- Two Public Subnets
- Two Private Subnets
- Internet Gateway
- NAT Gateway
- Public and Private Route Tables
- Security Groups
- Application Load Balancer (ALB)
- Launch Template
- Auto Scaling Group
- Amazon Linux 2023 EC2 Instances
- PostgreSQL RDS Instance
- Modular Terraform Structure
- Outputs for important infrastructure resources


## Project Structure

```
.
├── providers.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
│
├── modules
│   ├── vpc
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── security
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── compute
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── database
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── README.md
```


## AWS Services Used

- Amazon VPC
- Amazon EC2
- Application Load Balancer
- Auto Scaling Group
- Launch Template
- Amazon RDS PostgreSQL
- Internet Gateway
- NAT Gateway
- Security Groups
- Route Tables


## AWS Configuration

Configure AWS CLI:

```bash
aws configure
```

Example:

```
AWS Access Key ID: ****************
AWS Secret Access Key: ****************
Default region: us-east-1
Default output format: json
```

Verify credentials:

```bash
aws sts get-caller-identity
```


## Terraform Workflow

### Initialize Terraform
```bash
terraform init
```

### Format Configuration
```bash
terraform fmt -recursive
```

### Validate Configuration
```bash
terraform validate
```

### Review Execution Plan
```bash
terraform plan
```

### Deploy Infrastructure
```bash
terraform apply
```

### View Outputs
```bash
terraform output
```

Example outputs:

- VPC ID
- Public Subnets
- Private Subnets
- ALB DNS Name
- RDS Endpoint


### Access the Web Application
Open the ALB DNS Name in the browser:
```
http://webapp-alb-359055033.us-east-1.elb.amazonaws.com
```

Example page:
```
Terraform Auto Scaling Web Server

Hostname:
ip-10-0-x-xxx.ec2.internal
```


## Infrastructure Components
### Networking
- Custom VPC
- Internet Gateway
- NAT Gateway
- Public Route Table
- Private Route Table
- Two Public Subnets
- Two Private Subnets


### Security
Three Security Groups were created:
#### ALB Security Group
- HTTP (80)
- HTTPS (443)

#### EC2 Security Group
- HTTP from ALB only

#### RDS Security Group
- PostgreSQL (5432) from EC2 Security Group only


### Compute
- Amazon Linux 2023
- Launch Template
- Auto Scaling Group
- Apache Web Server installed using User Data


### Database
- Amazon RDS PostgreSQL
- Private Subnets
- Not Publicly Accessible
- DB Subnet Group


## Learning Outcomes

This project demonstrates practical experience with:

- Infrastructure as Code (IaC)
- Terraform Modules
- AWS Networking
- High Availability Architecture
- Auto Scaling
- Load Balancing
- Secure Database Deployment
- AWS Resource Provisioning
- Cloud Infrastructure Automation

# AWS Production-Grade 3-Tier HA Architecture (Terraform)

## 📌 Overview
This project demonstrates a production-grade, highly available 3-tier architecture deployed on AWS using Terraform with a modular infrastructure design and remote state management.

The architecture follows industry best practices including network isolation, high availability, and secure service-to-service communication.

---

## 🏗 Architecture Design

Internet  
↓  
Application Load Balancer (Public Subnets - Multi AZ)  
↓  
Auto Scaling Group - EC2 (Private App Subnets - Multi AZ)  
↓  
Amazon RDS MySQL (Private DB Subnets - Multi AZ)

---

## 🚀 Key Features

- Multi-AZ high availability
- Public and private subnet isolation
- Application Load Balancer with health checks
- Auto Scaling Group with Launch Template
- RDS MySQL (Multi-AZ deployment)
- Security Group chaining (ALB → EC2 → RDS)
- Terraform S3 Remote Backend
- DynamoDB State Locking

---

## 🔐 Security Implementation

- EC2 instances are deployed in private subnets
- RDS is not publicly accessible
- Only ALB can communicate with EC2
- Only EC2 can communicate with RDS
- No direct internet access to application or database layer

---

## 🛠 Technologies Used

- AWS
- Terraform
- Amazon VPC
- Application Load Balancer (ALB)
- Auto Scaling Group
- Amazon EC2
- Amazon RDS (MySQL)
- Amazon S3
- DynamoDB

---

## 💡 Deployment

```bash
terraform init
terraform plan
terraform apply

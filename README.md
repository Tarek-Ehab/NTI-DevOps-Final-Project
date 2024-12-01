# NTI DevOps Final Project  

This repository contains the final project for the NTI DevOps course, demonstrating expertise in cloud infrastructure, automation, containerization, and CI/CD. The project uses AWS, Terraform, Ansible, Docker, Kubernetes, and Jenkins to create a fully automated deployment pipeline for a cloud-native application.

## Project Overview

### 1. **Terraform**  
Infrastructure as Code (IaC) is used to provision the following AWS resources:  
- **EKS Cluster**:  
  - Two-node cluster with an auto-scaling group and Elastic Load Balancer (ELB).  
- **RDS Instance**:  
  - Stores database credentials securely in AWS Secrets Manager.  
- **EC2 Instance**:  
  - Hosts Jenkins for CI/CD pipeline.  
- **AWS Backup Service**:  
  - Creates daily snapshots of the Jenkins instance for backup and recovery.  
- **S3 Bucket**:  
  - Stores ELB access logs.  
- **ECR (Elastic Container Registry)**:  
  - Stores Docker images.

### 2. **Ansible**  
Automates the configuration of the following components:  
- **Jenkins Installation**:  
  - Includes plugins and custom configurations.  
- **CloudWatch Agent**:  
  - Installed on all EC2 instances to enable monitoring and logging.

### 3. **Docker**  
Containerizes the application and ensures local development consistency:  
- **Docker Images**:  
  - Built for the application code.  
- **Docker Compose**:  
  - Runs the application locally with all required services.

### 4. **Kubernetes**  
Manages container orchestration using Kubernetes:  
- **Kubernetes Manifests**:  
  - Deploys the application on the AWS EKS cluster.  
- **Network Policies**:  
  - Implements security best practices for communication between pods.

### 5. **Jenkins**  
Sets up a multi-branch CI/CD pipeline:  
- **Pipeline Triggers**:  
  - Builds triggered by every push to all GitHub branches.  
- **Pipeline Stages**:  
  1. **Build**: Creates a Docker image from the `Dockerfile` in the repository.  
  2. **Push**: Uploads the image to AWS ECR.  
  3. **Deploy**: Updates Kubernetes pods with the new image.

## Requirements  
- **AWS CLI**  
- **Terraform**  
- **Ansible**  
- **Docker & Docker Compose**  
- **Kubernetes CLI (kubectl)**  
- **Jenkins**  

## Usage  
1. Clone this repository:  
   ```bash  
   git clone <repository-url>  
   cd NTI-DevOps-Final-Project

# Stage 1: Local Deployment with Ansible & Vagrant

## Objectives
- Deploy the E-Commerce application on a local Vagrant VM.  
- Use Docker containers to run the frontend (React) and backend (Node.js) services.  
- Automate deployment with Ansible roles.  


## Key Components

### Roles
- **Backend Role:** Pulls or builds the backend Docker image, starts the container, exposes port `5000`, and waits for the API health check.  
- **Client Role:** Pulls the frontend Docker image, starts the container on port `3000`, and waits for the frontend to be ready.  

### Variables (`vars/main.yaml`)
Stores all application variables, including:
- Docker image names  
- Container names and ports  
- Docker network name  
- Environment variables  

### Playbook
- Executes the roles sequentially.  
- Ensures Docker network is created and containers are running.  
- Waits for application readiness.  

### Vagrant
- Provides a reproducible local VM environment.  
- Installs Docker and Python for Ansible.  

## Outcome
- Local VM runs both frontend and backend containers.  
- Application is accessible via [http://localhost:3000](http://localhost:3000).  
- Full automation is achieved with a single `ansible-playbook playbook.yaml` command.

# Stage 2: AWS Deployment with Terraform & Ansible

## Objectives
- Provision EC2 instances on AWS using Terraform.
- Use Ansible to configure the servers and deploy the Dockerized application.  
- Automate the full infrastructure and application deployment workflow.  

## Folder Structure
```
stage-1-Ansible-root/
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── terraform.tfvars
├── roles/
│ ├── backend/
│ └── client/
├── vars/
│ └── main.yaml
```


## Key Components

### Terraform
- **Provider:** AWS configuration (aws provider, region, credentials).  
- **Resources:**  
  - `aws_instance` for backend and frontend servers.  
  - `aws_security_group` allowing HTTP (80), HTTPS (443), SSH (22), and ICMP.  
- **Outputs:** EC2 public IPs and Ansible inventory/playbook references.  
- Automates infrastructure provisioning, which Ansible can then use for configuration.  

### Ansible Integration
- Pulls Docker images and starts containers on EC2 instances.  
- Configures the application environment similar to Stage 1.  
- Playbook triggers both Terraform provisioning and server configuration.  

### Security & Networking
- Security groups configured for proper port access.  
- Docker network ensures communication between frontend and backend containers.  

## Outcome
- EC2 instances are created and configured automatically.  
- Docker containers run on AWS, and the application is publicly accessible via `http://<EC2-public-ip>:3000`.  
- Full automation from infrastructure provisioning to application deployment.  

## Summary
- **Stage 1:** Local deployment, ideal for development and testing.  
- **Stage 2:** Cloud deployment on AWS, demonstrating Infrastructure as Code and integration of Terraform with Ansible.  

**Best practices followed include:**
- Use of roles and variables in Ansible.  
- Docker containerization for modularity.  
- Secure and reproducible infrastructure provisioning.  
- Automation of end-to-end deployment.

# YOLO App Deployment on Kubernetes (EKS)

## Overview
This project demonstrates the deployment of the **YOLO application** on Kubernetes, hosted on **AWS EKS**. It covers the orchestration of multiple components, including a backend API, frontend client, and MongoDB database.

---

## Kubernetes Objects Used

### 1. StatefulSets
- **Used for MongoDB** to manage database pods.  
- **Reason for choice:** MongoDB requires persistent, stable storage and unique network identifiers per pod. StatefulSets ensure:
  - Stable pod names (e.g., `mongodb-0`, `mongodb-1`)  
  - Persistent volume claims per pod, preserving data across pod restarts  
  - Ordered, deterministic deployment and scaling  

### 2. Deployments
- **Used for backend and client applications**.  
- **Reason for choice:** Backend and client services are stateless and do not require stable storage or identity. Deployments provide:
  - Easy scaling  
  - Rolling updates  
  - Automated self-healing in case of pod failures  

### 3. Services
- **Used to expose pods internally and externally**:  
  - **ClusterIP**: Used for internal communication between pods (MongoDB internal access).  
  - **LoadBalancer**: Used for backend and frontend services to allow internet access via AWS ELB.  

---

## Exposure to Internet Traffic
- The **backend** and **client** pods are exposed using **LoadBalancer Services**.  
- Each service automatically provisions an **AWS Elastic Load Balancer (ELB)** and assigns a public DNS name.  
- Example endpoints:
  - Backend: `http://<backend-ELB-dns>:5000`
  - Client: `http://<client-ELB-dns>:3000`

---

## Persistent Storage
- Persistent storage is used **only for MongoDB**.  
- **PersistentVolumeClaims (PVCs)** are dynamically provisioned using the **AWS EBS CSI driver**.  
- Benefits of using persistent storage:
  - Database data persists across pod restarts or node failures.  
  - Each MongoDB pod has a dedicated volume bound to it.  

- The backend and client pods do **not use persistent storage**, as they are stateless and can be recreated without data loss.

---

## Notes
- The application components communicate via Kubernetes services internally.  
- The backend connects to MongoDB using the StatefulSet service DNS.  
- Kubernetes self-healing ensures pods are restarted if they crash, maintaining application availability.
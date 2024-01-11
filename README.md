# Team Project

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [CI/CD Pipeline](#cicd-pipeline)
- [Kubernetes Configuration](#kubernetes-configuration)
- [Contributing](#contributing)
- [License](#license)

## Overview

This repository contains the infrastructure-as-code (IaC) setup for an Amazon EKS (Elastic Kubernetes Service) cluster using Terraform. The EKS cluster hosts a React frontend, Java backend with PostgreSQL as the database. The project includes a CI/CD pipeline implemented with CircleCI and ArgoCD for automated deployment.

## Features

- Infrastructure provisioning with Terraform.
- React frontend, Java backend, and PostgreSQL application.
- Continuous Integration/Continuous Deployment (CI/CD) with CircleCI and ArgoCD.
- Kubernetes configuration for frontend and backend services.
- Ingress rules defined for routing traffic.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- AWS account with necessary permissions.
- Terraform installed locally.
- CircleCI and ArgoCD configured.
- Kubernetes command-line tool (kubectl) installed.

## Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Honghao-Zheng/team-project.git
   cd team-project

2. **Configure Terraform variables:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
    ```
   Edit **terraform.tfvars** with your AWS credentials and other required variables.

3. **Initialize and apply Terraform:**
    ```bash
    terraform init
    terraform apply

## Usage
After the setup is complete, deploy your applications using the CI/CD pipeline. Commits to the **\`main\`** branch trigger automatic deployments.

## CI/CD Pipeline
The CI/CD pipeline is implemented using CircleCI. The pipeline includes:

Automated testing.
Build and push Docker images.
Deployment using ArgoCD.
Refer to the **\`.circleci/config.yml\`** file for pipeline details.

## Kubernetes Configuration
Kubernetes configuration files (**\`k8s/\`**) are provided for the frontend and backend services. Adjust these files as needed for your application.

Ingress rules are defined in **\`k8s/ingress.yaml\`** for routing external traffic.

## Contributing
Contributions are welcome! Follow these steps to contribute:

Fork the repository.
Create a new branch: git checkout -b feature/your-feature-name.
Make your changes and commit: git commit -m 'Add new feature'.
Push to the branch: git push origin feature/your-feature-name.
Create a pull request.
Please follow our Contribution Guidelines for more details.
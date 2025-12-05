# Local DevSecOps Platform 🚀

A complete CI/CD pipeline built to simulate a cloud-native environment using **Jenkins**, **Docker**, and **Terraform**.

## 🏗 Architecture
1. **Infrastructure:** Terraform provisions a Jenkins server and a custom Docker Network.
2. **App:** A Python Flask microservice.
3. **Pipeline:** Jenkins automates the Build -> Push -> Deploy workflow.

## 🛠 Tools Used
* **Terraform:** Infrastructure as Code (IaC)
* **Jenkins:** CI/CD Automation
* **Docker & Docker Hub:** Containerization & Registry
* **Python:** Application Logic

## 📸 Screenshots
*(Upload your screenshots here later)*

## 🚀 How to Run
1. Clone the repo.
2. Run `terraform apply` to start the infrastructure.
3. Trigger the Jenkins pipeline to deploy the app.
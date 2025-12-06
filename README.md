# 🚀 Automated Cloud-Native DevSecOps Platform

A complete, end-to-end **DevSecOps** pipeline built to simulate a production-grade cloud environment. This project demonstrates **Infrastructure as Code (IaC)**, **Container Orchestration**, **CI/CD Automation**, and **Real-time Observability**.

---

## 🏗 Architecture Overview

* **Infrastructure:** Terraform provisions a custom Docker Network and simulated servers (Jenkins, Prometheus, Grafana).
* **Application:** A Python Flask microservice containerized with Docker.
* **CI/CD:** Jenkins automates the lifecycle: `Checkout` -> `Build` -> `Push to Registry` -> `Deploy`.
* **Monitoring:** Prometheus scrapes metrics; Grafana visualizes infrastructure health.

---

## 🛠 Tech Stack

| Category | Tools Used |
| :--- | :--- |
| **Infrastructure as Code** | Terraform (HCL) |
| **Containerization** | Docker, Docker Hub |
| **CI/CD Automation** | Jenkins (Groovy Pipeline) |
| **Monitoring & Logging** | Prometheus, Grafana |
| **Application Logic** | Python (Flask) |
| **Version Control** | Git, GitHub |

---

## 📸 Project Evidence

### 1. Automated CI/CD Pipeline (Jenkins)
*Successfully built, pushed, and deployed the application container.*
![Jenkins Pipeline](screenshots/pipeline.png)

### 2. Infrastructure Monitoring (Grafana)
*Real-time visualization of container CPU, Memory, and Network usage.*
![Grafana Dashboard](screenshots/grafana.png)

### 3. Service Discovery (Prometheus)
*Prometheus target configuration successfully scraping Jenkins metrics.*
![Prometheus Targets](screenshots/targets.png)

### 4. Application Deployment
*The Python Microservice running live after automated deployment.*
![Live App](screenshots/app.png)

### 5. Artifact Management (Docker Hub)
*Secure storage of versioned container images.*
![Docker Hub](screenshots/dockerhub.png)

---

## 🚀 How to Run Locally

### Prerequisites
* Docker Desktop (Ensure API 1.44+ compatibility)
* Terraform
* Git

### Steps
1.  **Clone the Repository**
    ```bash
    git clone [https://github.com/JubethSB/local-devops-project.git](https://github.com/JubethSB/local-devops-project.git)
    cd local-devops-project
    ```

2.  **Provision Infrastructure (Terraform)**
    ```bash
    cd terraform
    terraform init
    terraform apply -auto-approve
    ```

3.  **Run the Pipeline**
    * Access Jenkins at `http://localhost:8080`.
    * Trigger the `DevOps-Pipeline` build.

4.  **Check Monitoring**
    * Access Grafana at `http://localhost:3000` (Default: `admin`/`admin`).

---

### 👤 Author
**Jubeth S B**
*Cloud Infrastructure & DevOps Engineer*
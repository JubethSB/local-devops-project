terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      # FIX: Allow newer versions of the provider to support Docker 1.44+
      version = ">= 3.0.0"
    }
  }
}

provider "docker" {
  # FIX: Use the standard Windows connection
  host = "npipe:////./pipe/docker_engine"
}

# --- NETWORK ---

resource "docker_network" "devops_net" {
  name = "devops_network"
}

# --- CI/CD SERVER (JENKINS) ---

resource "docker_image" "jenkins" {
  name         = "jenkins/jenkins:lts"
  keep_locally = false
}

resource "docker_container" "jenkins_server" {
  name  = "jenkins-server"
  image = docker_image.jenkins.name
  
  ports {
    internal = 8080
    external = 8080
  }
  
  ports {
    internal = 50000
    external = 50000
  }
  
  networks_advanced {
    name = docker_network.devops_net.name
  }
  
  # Allow Jenkins to control Docker (Docker-in-Docker)
  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }
}

# --- MONITORING STACK ---

# 1. Prometheus (The Data Collector)
resource "docker_image" "prometheus" {
  name         = "prom/prometheus:latest"
  keep_locally = false
}

resource "docker_container" "prometheus" {
  name  = "prometheus-server"
  image = docker_image.prometheus.name
  
  ports {
    internal = 9090
    external = 9090
  }
  
  networks_advanced {
    name = docker_network.devops_net.name
  }

  # Mount the config file dynamically
  # This looks for the file in: local-devops-project/monitoring/prometheus.yml
  volumes {
    host_path      = abspath("${path.cwd}/../monitoring/prometheus.yml")
    container_path = "/etc/prometheus/prometheus.yml"
  }
}

# 2. Grafana (The Dashboard)
resource "docker_image" "grafana" {
  name         = "grafana/grafana:latest"
  keep_locally = false
}

resource "docker_container" "grafana" {
  name  = "grafana-server"
  image = docker_image.grafana.name
  
  ports {
    internal = 3000
    external = 3000
  }
  
  networks_advanced {
    name = docker_network.devops_net.name
  }
}
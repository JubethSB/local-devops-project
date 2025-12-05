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

resource "docker_network" "devops_net" {
  name = "devops_network"
}

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
  
  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }
}
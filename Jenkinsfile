pipeline {
    agent any
    environment {
        // Replace 'jubethsb' with YOUR Docker Hub username
        DOCKER_IMAGE = 'jubethsb/my-devops-app'
        DOCKER_TAG = 'latest'
        registryCredential = 'docker-hub-creds'
    }
    stages {
        stage('Checkout') {
            steps {
                // This pulls your code from GitHub automatically
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE:$DOCKER_TAG ./app"
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: registryCredential, passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh "docker login -u $USER -p $PASS"
                        sh "docker push $DOCKER_IMAGE:$DOCKER_TAG"
                    }
                }
            }
        }
        stage('Deploy (Simulated)') {
            steps {
                script {
                    // Remove old container if it exists
                    sh "docker rm -f devops-app-run || true"
                    // Run new container
                    sh "docker run -d -p 5000:5000 --name devops-app-run $DOCKER_IMAGE:$DOCKER_TAG"
                }
            }
        }
    }
}
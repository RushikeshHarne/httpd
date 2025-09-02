pipeline {
    agent any

    environment {
        IMAGE_NAME = "rush/test:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                script {
                    sh """
                    docker stop my-app || true
                    docker rm my-app || true
                    """
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run -d -p 80:80 --name my-app ${IMAGE_NAME}"
                }
            }
        }
    }
}

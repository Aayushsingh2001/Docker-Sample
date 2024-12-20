pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE= "my-static-website"
        GITHUB_REPO= "https://github.com/Aayushsingh2001/Docker-Sample.git"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning Repository......'
                git branch: 'main', url: "${GITHUB_REPO}"
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image......'
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                echo 'Running Docker Image in Container......'
                script {
                    sh """
                    docker stop website-container || true
                    docker rm website-container || true
                    """
                    sh "docker run -d --name website-container -p 80:80 ${DOCKER_IMAGE}"
                }
            }
        }
    }
}

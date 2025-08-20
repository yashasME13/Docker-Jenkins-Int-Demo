pipeline {
    agent any

    tools {
        maven 'Maven-3'   // the Maven name you added in Jenkins
    }

    environment {
        DOCKER_IMAGE = "my-springboot-app"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/yashasME13/Docker-Jenkins-Int-Demo.git'
            }
        }

        stage('Build JAR with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 8080:8080 $DOCKER_IMAGE'
            }
        }
    }
}

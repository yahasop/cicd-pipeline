pipeline {
    agent any
    
    tools {
        nodejs 'nodejs7'
        dockerTool 'docker-lab'
    }
    
    stages {
        stage('SCM Checkout') {
            steps {
                echo 'SCM Checkout'
                checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/yahasop/cicd-pipeline.git']])
            }
        }
        stage('Build') {
            steps {
                echo 'Build'
                sh 'npm install'
                sh 'ls'
            }
        }
        stage('Testing') {
            steps {
                echo 'Testing'
                sh 'npm test'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Build Docker Image'
                sh 'docker build . -t nodedev:v1.0'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy'
                sh 'docker stop nodedev1.0 || true'
                sh 'docker rm nodedev1.0 || true'
                sh 'docker run -d --expose 3000 -p 3000:3000 --name nodedev1.0 nodedev:v1.0'
            }
        }
    }
}

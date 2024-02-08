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
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/yahasop/cicd-pipeline.git']])
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
                sh 'docker build . -t nodemain:v1.0'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy'
                sh 'docker stop nodemain1.0 || true'
                sh 'docker rm nodemain1.0 || true'
                sh 'docker run -d --expose 3000 -p 3000:3000 --name nodemain1.0 nodemain:v1.0'
            }
        }
    }
}

pipeline {
    agent any
    
    tools {
        nodejs 'nodejs7'
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
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy'
            }
        }
    }
}

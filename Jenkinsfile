pipeline {
    
    agent {
        node {
            label 'node-ssh'
        }
    }
    
    environment {
        REGISTRY = "rbouikila/docker-test"
    }
    
    stages {
       // Build docker image with docker-workflow plugin
        stage('Build docker image') {
            steps {
                script {
                    dockerImage = docker.build REGISTRY
                }
            }
        }
        
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying..'
            }
        }
        
    }
}

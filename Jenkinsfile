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
        
                // Security check with Aquasecurity (Trivy)
        stage('Check Security - Trivy') {
            steps {
                script {
                    def trivyResult = sh(returnStatus: true, script: "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy:0.12.0 --no-progress ${REGISTRY}:latest")
                    if (trivyResult != 0) {
                        error("Security check failed. Trivy discovered critical vulnerabilities.")
                    }
                }
            }
        }
        
            // Push docker image with docker-workflow plugin
        stage('Publish image to registry - plugin ') {
            steps {
                script {
                    docker.withRegistry('', 'remydockerhub') {
                        dockerImage.push("latest")
                    }
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

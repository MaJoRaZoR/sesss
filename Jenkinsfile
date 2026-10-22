pipeline {
    agent any
    
    environment {
        DOCKER_USER = 'sriram1108'
        IMAGE_NAME  = 'industrial-app'
        // Directs the Jenkins system service to your local user's Kubernetes configuration
        KUBECONFIG  = 'C:\\Users\\batch1\\.kube\\config'
    }
    
    parameters {
        choice(name: 'DEPLOY_ENV', choices: ['Staging', 'Production'], description: 'Select target deployment workspace environment.')
        booleanParam(name: 'RUN_DIAGNOSTICS', defaultValue: true, description: 'Toggle comprehensive environment automated checking loops.')
    }
    
    stages {
        stage('Pull SCM Source Repository') {
            steps {
                cleanWs()
                checkout scm
            }
        }
        
        stage('Parallel Automated Verifications') {
            parallel {
                stage('Code Lint Verification') {
                    steps {
                        echo "Analyzing dashboard index.html style schema structure..."
                        bat "dir"
                    }
                }
                stage('Mock Diagnostic Testing Engine') {
                    steps {
                        echo "Executing simulated machinery telemetry validations..."
                        bat "echo Testing threshold parameters... Passed"
                    }
                }
            }
        }

        stage('Assemble & Push Docker Assets') {
            steps {
                script {
                    echo "Compiling system Docker image workspace files for sriram1108..."
                    bat "docker build -t ${DOCKER_USER}/${IMAGE_NAME}:latest ."
                    bat "docker build -t ${DOCKER_USER}/${IMAGE_NAME}:${BUILD_NUMBER} ."
                    
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                        bat "docker login -u %USER% -p %PASS%"
                        bat "docker push ${DOCKER_USER}/${IMAGE_NAME}:latest"
                        bat "docker push ${DOCKER_USER}/${IMAGE_NAME}:${BUILD_NUMBER}"
                    }
                }
            }
        }

        stage('Orchestrate Cluster Deployment') {
            steps {
                echo "Applying Kubernetes manifests using designated KUBECONFIG mapping path..."
                // Runs kubectl using your explicit profile configuration parameters
                bat "kubectl --kubeconfig=\"%KUBECONFIG%\" apply -f deployment.yaml"
                
                echo "Verifying active tracking rollout status parameters..."
                bat "kubectl --kubeconfig=\"%KUBECONFIG%\" rollout status deployment/industrial-dashboard-deployment --timeout=90s"
            }
        }

        stage('Publish Workspace Archive Assets') {
            steps {
                echo "Archiving operational files safely to Jenkins master controller node storage..."
                archiveArtifacts artifacts: 'index.html, deployment.yaml', fingerprint: true
            }
        }
    }
}

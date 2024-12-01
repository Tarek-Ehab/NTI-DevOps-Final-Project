pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('docker credentials')  // Docker Hub credentials
        AWS_REGION = 'us-east-1'  // AWS region
        CLUSTER_NAME = 'my-eks-cluster'  // EKS cluster name
    }

    stages {
        stage('Configure Kubeconfig') {
            steps {
                script {
                    // Make sure AWS CLI is installed and AWS credentials are configured
                    sh "aws eks --region ${AWS_REGION} update-kubeconfig --name ${CLUSTER_NAME}"
                }
            }
        }

        stage('DockerHub Login') {
            steps {
                script {
                    sh '''
                        echo $DOCKER_CREDENTIALS_PSW | docker login -u $DOCKER_CREDENTIALS_USR --password-stdin
                    '''
                }
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    echo "Building Docker images..."
                    sh '''
                        docker build -t tarekehab/frontend frontend/.
                        docker build -t tarekehab/backend backend/.
                    '''
                }
            }
        }

        stage('Push Docker Images') {
            steps {
                script {
                    echo "Pushing Docker images..."
                    sh '''
                        docker push tarekehab/frontend
                        docker push tarekehab/backend
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    echo "Deploying to EKS cluster..."
                    sh '''
                        kubectl apply -f k8s/front.yaml
                        kubectl apply -f k8s/backend.yaml
                        kubectl apply -f k8s/mongodebloyment.yaml
                        kubectl apply -f k8s/pv.pvc.yaml
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "Deployment was successful!"
        }
        failure {
            echo "Deployment failed!"
        }
    }
}

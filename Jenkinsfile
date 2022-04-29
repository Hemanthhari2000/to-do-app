pipeline {
    agent any
    environment {
        ACCESS_KEY = credentials('AWS_ACCESS_KEY_ID')
        SECRET_KEY = credentials('AWS_SECRET_ACCESS_KEY')

    }
    stages {

        stage('Docker') {
            steps {
                sh '''
                    echo "running the tests ......."
                    kubectl version
                '''
            }
        }

        stage('Terraform') {
            steps {
                sh '''
                 /usr/local/bin/terraform init -force-copy
                 /usr/local/bin/terraform plan
                 /usr/local/bin/terraform apply -auto-approve
                 /usr/local/bin/aws eks --region us-east-1 update-kubeconfig --name eks-kubeginners
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    echo "deploying the application ........"
                    kubectl apply -f kubernetes-deployment.yml
                    kubectl apply -f kubernetes-service.yml
                    kubectl get svc eks-kubeginners-service
                '''
            }
        }
    }
}




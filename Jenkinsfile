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
                '''
            }
        }

        stage('Terraform') {
            steps {
                sh '''
                 /usr/local/bin/terraform init -force-copy
                 /usr/local/bin/terraform plan
                 /usr/local/bin/terraform apply -auto-approve
                 
                '''
            }
        }

        stage('Deploy') {
            steps {
                withAWS(profile:'966185979698_Admin-Account-Access'){
                    withKubeConfig([serverUrl: 'https://9246A709441193FA47A650C407B49119.gr7.us-east-1.eks.amazonaws.com']) {    
                        sh '''
                            echo "deploying the application ........"
                            /usr/local/bin/aws eks --region us-east-1 update-kubeconfig --name eks-kubeginners
                            /usr/local/bin/kubectl apply -f kubernetes-deployment.yml
                            /usr/local/bin/kubectl apply -f kubernetes-service.yml
                            /usr/local/bin/kubectl get svc eks-kubeginners-service
                        '''
                    }
                }
            }
        }
    }
}




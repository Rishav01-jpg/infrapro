pipeline {
    agent any

    stages {
        stage('Infrastructure') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'aws-infrapro',
                        usernameVariable: 'AWS_ACCESS_KEY_ID',
                        passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                    ),
                    sshUserPrivateKey(
                        credentialsId: 'infrapro-ssh',
                        keyFileVariable: 'SSH_KEY'
                    )
                ]) {
                    sh '''
                        set -e

                        chmod 600 "$SSH_KEY"

                        ssh-keygen -y -f "$SSH_KEY" > "$WORKSPACE/infrapro-jenkins.pub"

                        cat > terraform/terraform.tfvars <<EOFVARS
aws_region         = "us-east-2"
project_name       = "infrapro"
environment        = "dev"
instance_type      = "t2.micro"
availability_zone  = "us-east-2a"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"

key_name           = "infrapro-jenkins-key"
public_key_path    = "$WORKSPACE/infrapro-jenkins.pub"
private_key_path   = "$SSH_KEY"
EOFVARS

                        cd terraform

                        terraform init
                        terraform validate
                        terraform plan
                        terraform apply -auto-approve
                    '''
                }
            }
        }
    }

    post {
        always {
            sh 'rm -f terraform/terraform.tfvars infrapro-jenkins.pub || true'
        }
    }
}

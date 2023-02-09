pipeline {
    agent any
    
    options {
        timestamps()
        ansiColor('xterm')
    }

    stages {
        stage('Build') {
            steps {
                echo 'Build'
            }
        }
        stage('Package') {
            steps {
                withCredentials([string(credentialsId: 'vozsiberiana-github', variable: 'CR_PAT')]) {
                    sh "echo $CR_PAT | docker login ghcr.io -u vozsiberiana --password-stdin"
                }
            }
        }
        stage('Deploy') {
            steps {
                sshagent(['ssh-amazon']) {
                    sh """
                        ssh -o "StrictHostKeyChecking no" ec2-3-248-195-102.eu-west-1.compute.amazonaws.com id
                    """
                }
            }
        }
    
    }
}

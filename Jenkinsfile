pipeline {

    agent any

    stages {
        stage ('Deploy') {
    	    steps{
                 withCredentials([sshUserPrivateKey(credentialsId: 'ssh-amazon', keyFileVariable: 'AWS_SSH_KEY')]) {
                      sh "ssh -i $AWS_SSH_KEY ec2-user@3.248.195.102 'docker pull ghcr.io/vozsiberiana/hello-2048/hello-2048:v1 && docker run -td --rm -p 80:80 ghcr.io/vozsiberiana/hello-2048/hello-2048:v1'"
     
        }
    }
}

    }
}


pipeline {

    agent any

    stages {
        stage ('Deploy') {
    	    steps{
                 sshagent(credentials:['amazon-test']) {
                 sh 'ssh -o StrictHostKeyChecking=no ec2-user@3.248.195.102 uptime'
                 sh 'ssh -v ec2-user@3.248.195.102'
		 sh 'ls'
                 sh 'docker run -it --rm -p 80:80 docker pull ghcr.io/vozsiberiana/hello-2048/hello-2048:v1'
        }
    }
}

    }
}


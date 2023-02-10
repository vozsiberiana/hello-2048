pipeline {
    agent any
    
    options {
        timestamps()
        ansiColor('xterm')
    }

    stages {
        stage('Build') {
            steps {
                sh 'docker-compose build'
            }
        }
        stage('Package') {
			
            steps {
		    echo "Start withcredentials"
		withCredentials([string(credentialsId: 'github-vozsiberiana', variable: 'GIT_TOKEN')]) {
                    echo 'finish withcredentials $GIT_TOKEN'
		    sh 'echo $GIT_TOKEN | docker login ghcr.io -u vozsiberiana --password-stdin'
		    sh 'docker-compose push'
                }
            }
        }
        stage('Deploy') {
            steps {
                sshagent(['ssh-amazon']) {
                    sh """
                        ssh -o "StrictHostKeyChecking no" ec2-user@3.248.195.102 'docker pull ghcr.io/vozsiberiana/hello-2048/hello-2048:v1 && docker run -td --rm -p 80:80 ghcr.io/vozsiberiana/hello-2048/hello-2048:v1'
                    """
                }
            }
        }
    
    }
}

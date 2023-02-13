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
		sh 'git tag 1.0.${BUILD_NUMBER}'
		sh 'docker tag ghcr.io/vozsiberiana/hello-2048/hello-2048:v1 ghcr.io/vozsiberiana/hello-2048/hello-2048:1.0.${BUILD_NUMBER}'
            }
        }
	stage ('Push GIT') {
	    steps {
		sshagent(['GIT']) {
                    sh 'git push git@github.com:vozsiberiana/hello-2048.git --tags'
		}
	    }
        }
        stage('Package') {
			
            steps {
		    echo "Start withcredentials"
		withCredentials([string(credentialsId: 'github-vozsiberiana', variable: 'GIT_TOKEN')]) {
                    echo 'finish withcredentials $GIT_TOKEN'
		    sh 'echo $GIT_TOKEN | docker login ghcr.io -u vozsiberiana --password-stdin'
                    sh 'docker push ghcr.io/vozsiberiana/hello-2048/hello-2048:1.0.${BUILD_NUMBER}'
		 }
            }
        }
        stage('Deploy') {
            steps {
                sshagent(['ssh-amazon']) {
                    sh """
                        ssh -o "StrictHostKeyChecking no" ec2-user@3.248.195.102 'docker pull ghcr.io/vozsiberiana/hello-2048/hello-2048:1.0.${BUILD_NUMBER} && docker run -td --rm -p 80:80 ghcr.io/vozsiberiana/hello-2048/hello-2048:1.0.${BUILD_NUMBER}'
                    """
                }
            }
        }
    
    }
}

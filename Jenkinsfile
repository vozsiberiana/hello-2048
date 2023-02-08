pipeline {
environment {
	USER = credentials('ssh-amazon')
}
    agent any

    stages {
        stage('Connect to instance') {
            steps {            
		echo "${USER}"   
	    }
	}
	stage('Build') {
            steps {
                sh 'docker-compose build'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}


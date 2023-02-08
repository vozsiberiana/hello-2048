pipeline {
    agent any

    stages {
        stage('Connect to instance') {
            steps {            
		USER = credentials('ssh-amazon')
	    	echo $USER   
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



pipeline {
    agent any

    stages {
        stage('git clone') {
          
            
        }

        stage('Build') {
            
        }

        stage('Test') {
            steps {
                script {
                    // Test commands
                    sh 'npm test'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy commands
                    sh './deploy.sh'
                }
            }
        }
    }

    post {
        always {
            // Actions to always execute (e.g., cleanup)
            cleanWs()
        }
    }
}

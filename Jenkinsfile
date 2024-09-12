
pipeline {
    agent any

    stages {
        stage('git clone') {
            steps{
                git credentialsId: 'Git-creds', url: 'https://github.com/Likhi-sf/star-agile-banking-finance.git'
            }
        }
    }
}

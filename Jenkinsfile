
pipeline {
    agent any

    stages {
        stage('git clone') {
            steps{
                git credentialsId: 'Git-creds', url: 'https://github.com/Likhi-sf/star-agile-banking-finance.git'
            }
        }

        stage('build'){
            script {
                    def mavenHome = tool name: "MVN_HOME", type: "maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} clean package"
            }
        }
    }
}

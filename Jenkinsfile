
pipeline {
    agent any

    stages {
        stage('git clone') {
            steps{
                git credentialsId: 'Git-creds', url: 'https://github.com/Likhi-sf/star-agile-banking-finance.git'
            }
        }

        stage('build'){
            steps{
                script {
                    def mavenHome = tool name: "MVN_HOME", type: "maven"
                    def mavenCMD = "${mavenHome}/bin/mvn"
                    sh "${mavenCMD} clean package"
                }
            }
        }

        stage('generate report'){
            steps{
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/project-pipeline/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
            }
        }

        stage('create Docker image'){
            steps{
                sh 'docker build -t likithlikhi8/financeproject:v1 .' 
            }
        }

        stage('docker hub login'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker-creds', passwordVariable: 'dockerpassword', usernameVariable: 'dockeruser')]){
                sh 'docker login -u ${dockeruser} -p ${dockerpassword}'
                }
            }
        }

        stage('docker push'){
            steps{
                sh 'docker push likithlikhi8/financeproject:v1'
            }
        }
        stage('deployment'){
            steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWSAccessKey', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    dir('terraform-files') {
                        sh 'terraform init'
                        sh 'terraform validate'
                        sh 'terraform apply --auto-approve'
                    }
                }
            }
        }
    }
}

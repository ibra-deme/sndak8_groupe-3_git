pipeline {
    agent any
    environment {
        KUBECONFIG = credentials('kuber_token')
        web_image = "my_php_image"
        db_image = "my_mysql_image"
        registry_credential = "docker-credential"
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/ibra-deme/sndak8_groupe-3_git.git'
            }
        }
        stage('Test') {
            steps {
                echo 'docker ps -a'
            }
        }
        // stage('Docker compose build') {
        //     steps {
        //         script {
        //             if (isUnix()) {
        //                 sh "docker-compose up -d --build"
        //             } else {
        //                 bat "docker-compose up -d --build"
        //             }
        //         }
        //     }
        // }
      
        // stage('Docker push') {
        //     steps {
        //         script {
        //             if (isUnix()) {
        //                 sh "docker push ibrademe/$web_image"
        //                 sh "docker push ibrademe/$db_image"
        //             } else {
        //                 bat "docker push ibrademe/$web_image"
        //                 bat "docker push ibrademe/$db_image"
        //             }
        //         }
        //     }
        // }
        stage('Kubernetes apply') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'kubectl apply -f kuber_aws/'
                    } else {
                        bat 'kubectl apply -f kuber_aws/web-deployment.yaml'
                    }
                }
            }
        }
    }
    post {
        success {
            slackSend channel: '#projet-aws', message: 'Code exécuté avec succès'
        }
        failure {
            slackSend channel: '#projet-aws', message: 'Code exécuté avec des erreurs'
        }
    }
}

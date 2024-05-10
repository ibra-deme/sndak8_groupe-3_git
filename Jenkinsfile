pipeline {
  agent any
  stages {

    stage('essaie') {
      steps {
        echo 'hello best world'
      }
    }
    stage ('test') {
      steps {
        bat 'docker ps -a'
      }
    }
    stage ('Run Docker Compose') {
      steps {
         script {
                    if (isUnix()) {
                        sh 'docker-compose up -d --build'
                    } else {
                        bat 'docker-compose up -d --build'
                    }
                }
      }
    }
  }
  post {
    success {
      slackSend channel: '#projet-aws', message: 'Code execute'
    }
    failure {
      slackSend channel: '#projet-aws', message: 'Code execute with error'
    }
  }
}

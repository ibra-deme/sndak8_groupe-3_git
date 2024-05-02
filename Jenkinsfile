pipeline {
  agent any
  stages {
    stage ('test') {
      steps {
        bat 'docker ps -a'
      }
    }
    stage ('Run Docker Compose') {
      steps {
        bat 'docker-compose up  -d'
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

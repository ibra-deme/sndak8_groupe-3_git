pipeline {
  agent any
  stages {
    stage ('test') {
      steps{
        bat 'docker ps -a'
      }
    }
    stage ('Run Docker Compose') {
      steps{
        bat 'docker-compose up --build -d'
      }
    }
  }
  
}
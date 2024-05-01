pipeline {
  agent any
  stages {
    stage ('test') {
      steps{
        sh 'docker ps -a'
      }
    }
    stage ('Run Docker Compose') {
      steps{
        sh 'sudo docker-compose up --build -d'
      }
    }
  }
  post{
    sucess{
        echo 'Votre build a reussi'
    }
    failure{
        echo'Erreur de build'
    }
  }
}
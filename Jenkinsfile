pipeline {
  agent any
  environment {
        // Définir les variables d'environnement nécessaires, par exemple les informations d'authentification Kubernetes
        KUBECONFIG = credentials('kubernetes_token') // ID des credentials de Kubernetes
        web_image = "my_php_image"
        db_image = "my_mysql_image"
        registrycredential="docker-credential"
    }
  stages {
    
    stage('Checkout') {
            steps {
                // Étape pour récupérer le code source depuis un système de contrôle de version comme Git
                git 'https://github.com/ibra-deme/sndak8_groupe-3_git.git'
            }
    }
    stage ('test') {
      steps {
        bat 'docker ps -a'
      }
    }
    stage (' Docker build') {
      steps {
         script {
                    if (isUnix()) {
                        sh 'docker build -t $(web_image) -f Web.Dockerfile .'
                        sh 'docker build -t $(db_image) -f Db.Dockerfile .'
                    } else {
                        bat 'docker build -t $(web_image) -f Web.Dockerfile .'
                        bat 'docker build -t $(db_image) -f Db.Dockerfile .'
                    }
                }
      }
    }
    stage (' Docker push') {
      steps {
         script {
                    if (isUnix()) {
                        sh 'docker push ibrademe/$(web_image)'
                        sh 'docker push ibrademe/$(db_image)'
                    } else {
                        bat 'docker push ibrademe/$(web_image)'
                        bat 'docker push ibrademe/$(db_image)'
                    }
                }
      }
    }
    stage (' Docker push') {
      steps {
         script {
                    if (isUnix()) {
                        sh 'kubectl apply -f kuber_aws/'
                    } else {
                        bat 'kubectl apply -f kuber_aws/'
                      
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

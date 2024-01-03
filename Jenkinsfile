pipeline {
  agent { label 'minecraft' }
  triggers { pollSCM '@monthly' }
  stages {
    stage('Global scripts') {
      steps {
        sh 'install -t /usr/local/bin global/*'
      }
    }
    stage('Server1 scripts') {
      steps {
        sh 'install -D -t ~/bin server/*'
      }
    }
  }
}
pipeline {
  triggers { pollSCM '@monthly' }
  agent none
  stages {
    stage('Global scripts') {
      agent { label 'minecraft' }
      steps {
        sh 'install -t /usr/local/bin global/*'
      }
    }
    stage('Server1 scripts') {
      agent { label 'server1' }
      steps {
        sh 'install -D -t ~/bin server/*'
      }
    }
    stage('Server2 scripts') {
      agent { label 'server2' }
      steps {
        sh 'install -D -t ~/bin server/*'
      }
    }
    stage('Server3 scripts') {
      agent { label 'server3' }
      steps {
        sh 'install -D -t ~/bin server/*'
      }
    }
    stage('Server4 scripts') {
      agent { label 'server4' }
      steps {
        sh 'install -D -t ~/bin server/*'
      }
    }
  }
  post { always { buildReport 'console' } }
}

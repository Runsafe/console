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
        sh 'test -d server1 && install -D -t ~ server1/*'
      }
    }
    stage('Server2 scripts') {
      agent { label 'server2' }
      steps {
        sh 'install -D -t ~/bin server/*'
        sh 'test -d server2 && install -D -t ~ server2/*'
      }
    }
    stage('Server3 scripts') {
      agent { label 'server3' }
      steps {
        sh 'install -D -t ~/bin server/*'
        sh 'test -d server3 && install -D -t ~ server3/*'
      }
    }
    stage('Server4 scripts') {
      agent { label 'server4' }
      steps {
        sh 'install -D -t ~/bin server/*'
        sh 'test -d server4 && install -D -t ~ server4/*'
      }
    }
  }
  post { always { buildReport 'console', 'Scripts updated' } }
}

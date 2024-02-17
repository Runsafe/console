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
        sh 'if [ -d server1 ]; then install -D -t ~ server1/*; fi'
        sh 'if [ -f crontab/server1 ]; then crontab crontab/server1; fi'
      }
    }
    stage('Server2 scripts') {
      agent { label 'server2' }
      steps {
        sh 'install -D -t ~/bin server/*'
        sh 'if [ -d server2 ]; then install -D -t ~ server2/*; fi'
        sh 'if [ -f crontab/server2 ]; then crontab crontab/server2; fi'
      }
    }
    stage('Server3 scripts') {
      agent { label 'server3' }
      steps {
        sh 'install -D -t ~/bin server/*'
        sh 'if [ -d server3 ]; then install -D -t ~ server3/*; fi'
        sh 'if [ -f crontab/server3 ]; then crontab crontab/server3; fi'
      }
    }
    stage('Server4 scripts') {
      agent { label 'server4' }
      steps {
        sh 'install -D -t ~/bin server/*'
        sh 'if [ -d server4 ]; then install -D -t ~ server4/*; fi'
        sh 'if [ -f crontab/server4 ]; then crontab crontab/server4; fi'
      }
    }
  }
  post { always { buildReport 'console', 'Scripts updated' } }
}

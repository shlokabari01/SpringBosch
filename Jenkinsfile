def imagename = "shlokabari06/project1"
def dockerImage = ''
def containerName="springbosch"
node {
    def sonarScanner = tool name: 'forSonar', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
    stage('Checkout') {
         git(url: 'https://github.com/shlokabari01/MavenBuild.git', branch: 'master')
    }
    stage('Build Project') {
        sh "mvn clean install"
        
    }
    stage('SonarQube Analysis'){
          withSonarQubeEnv(credentialsId: 'sonarCredentials') {
           sh "${sonarScanner}/bin/sonar-scanner
            } 
    }
    stage('Building image') {
        script {
          dockerImage = docker.build imagename
      }
    }
    stage('Deploy Image') {
          withCredentials([usernamePassword(credentialsId: 'DocCred', passwordVariable: 'DocCredPassword', usernameVariable: 'DocCredUser')]) {
            sh "docker login -u ${env.DocCredUser} -p ${env.DocCredPassword}"
            sh 'docker push shlokabari06/project1:latest'
      }
    }
   node('kubernateMaster') {
        stage('Run App') {
            sh """
                kubectl get pods
               
            """
        }
    }
}

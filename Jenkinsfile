def imagename = "shlokabari06/project1"
def dockerImage = ''
def containerName="springbosch"
node {
   
    stage('Checkout') {
         git(url: 'https://github.com/shlokabari01/SpringBosch.git', branch: 'master')
    }
    stage('Build Project') {
        sh "mvn clean install"
        
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
                #kubectl create deployment kubernetes-sprinboot --image=docker.io/shlokabari06/project1:latest --port=8090
                kubectl get pods
                
               
            """
        }
    }
}

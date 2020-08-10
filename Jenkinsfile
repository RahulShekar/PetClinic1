pipeline {
  environment {
    registry = 'rahulshekar/petclinic'
    registryCredential = 'docker_hub_rahulshekar'
    dockerImage = ''
  }
  agent any
  stages{
    stage ('Build') {
      steps{
        echo "Building Project"
        sh './mvnw package'
      }
    }
    stage ('Archive') {
      steps{
        echo "Archiving Project"
        archiveArtifacts artifacts: '**/*.jar', followSymlinks: false
      }
    }
    stage ('Build Docker Image') {
      steps{
        echo "Building Docker Image"
        script {
        dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage ('Push Docker Image') {
      steps{
        echo "Pushing Docker Image"
        script {
      withDockerRegistry(credentialsId: 'docker_hub_rahulshekar') {
        dockerImage.push()
        dockerImage.push('latest')
          }
        }
      }
    }
    stage ('Deploy to Dev') {
      steps{
        echo "Deploying to Dev Environment"
        sh "docker run -d --name=petclinic -p 8081:8080 rahulshekar/petclinic"
      }
    } 
  }
}

node {
    stage ('Git Checkout') {
        git branch: 'main', url: 'https://github.com/krishtambe/CloudProject.git'
    }
    stage ('Build the docker image') {
        sh 'sudo docker build -t $JOB_NAME:v1.$BUILD_ID .'
    }
    stage ('Tag the docker image') {
        sh 'sudo docker image tag $JOB_NAME:v1.$BUILD_ID tambekrish/$JOB_NAME:v1.$BUILD_ID'
        sh 'sudo docker image tag $JOB_NAME:v1.$BUILD_ID tambekrish/$JOB_NAME:v1.latest'
    }
    stage ('Push docker image to the dockerhub') {
        withCredentials([string(credentialsId: 'dp', variable: 'dp')]) {
             sh 'docker login -u tambekrish -p ${dp}'
             sh 'sudo docker push tambekrish/$JOB_NAME:v1.$BUILD_ID'
             sh 'sudo docker push tambekrish/$JOB_NAME:v1.latest'
	}
    }
}

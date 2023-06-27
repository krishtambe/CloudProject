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
}

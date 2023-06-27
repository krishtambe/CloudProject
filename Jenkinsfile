node {
    stage('Git Checkout'){
        git branch: 'main', url: 'https://github.com/krishtambe/CloudProject.git'
    }
    stage ('Build the docker image'){
        sh 'sudo docker build -t $JOB_NAME:v1.$BUILD_ID .'
    }
}

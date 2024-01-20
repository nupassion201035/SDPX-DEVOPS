pipeline{
    agent {label 'build-server'}
    environment{
        APP_NAME = "test app name"
    }
    stages{
        stage('Build Image'){
            steps{
                sh "echo ${env.APP_NAME}"
                sh "docker version"
                sh "docker build -t registry.gitlab.com/nupassion201035/sdpx-devops ."
            }
        }
    stage('Delivery'){
        steps{
            wwithcredentials(
                [usernamepassword(
                    credentialsId: 'gitlab-user01', 
                    passwordVariable: 'GITLAB_PASSWORD', 
                    usernameVariable: 'GITLAB_USER'
                    )]){
                sh "docker login -u ${env.GITLAB_USER} -p ${env.GITLAB_PASSWORD} registry.gitlab.com"
                sh "docker push registry.gitlab.com/nupassion201035/sdpx-devops"
            }
        }
    }
}
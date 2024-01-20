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
    }
}
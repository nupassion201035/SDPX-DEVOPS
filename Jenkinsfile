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
                withCredentials(
                    [usernamePassword(
                        credentialsId: 'gitlab-user01', 
                        passwordVariable: 'GITLAB_PASSWORD', 
                        usernameVariable: 'GITLAB_USER'
                    )]
                ){
                    sh "docker login registry.gitlab.com -u ${GITLAB_USER} -p ${GITLAB_PASSWORD}"
                    sh "docker push registry.gitlab.com/nupassion201035/sdpx-devops"
                }
            }
        }
    }
}
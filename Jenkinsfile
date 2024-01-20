pipeline{
    agent {label 'build-server'}
    environment{
        APP_NAME = "test app name"
        IMAGE_NAME = "registry.gitlab.com/nupassion201035/sdpx-devops"
    }
    stages{
        stage('Build Image'){
            steps{
                sh "echo ${env.APP_NAME}"
                sh "docker version"
                sh "docker build -t ${IMAGE_NAME} ."
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
                    sh "docker tag ${IMAGE_NAME} ${IMAGE_NAME}:${env.BUILD_NUMBER}"
                    sh "docker push ${IMAGE_NAME}"
                    sh "docker push ${IMAGE_NAME}:${env.BUILD_NUMBER}"
                    sh "docker rmi ${IMAGE_NAME}"
                    sh "docker rmi ${IMAGE_NAME}:${env.BUILD_NUMBER}"
                }
            }
        }

        stage('Deploy'){
            steps{
                sh "kubectl apply -f my-web.yaml"
            }
        }

    }
}
pipeline{
    agent {label 'appserver'}
    stages{
        stage('checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/virajhanmante/C3-Assignment-Viraj.git']]])
            }
        }
        stage('build and push image to ecr'){
            steps{
                sh '''aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 058107942271.dkr.ecr.us-east-1.amazonaws.com
                docker build -t c3-assign .
                docker tag c3-assign:latest 058107942271.dkr.ecr.us-east-1.amazonaws.com/c3-assign:latest
                docker push 058107942271.dkr.ecr.us-east-1.amazonaws.com/c3-assign:latest'''
            }
        }
        stage('run container'){
            steps{
                sh '''docker run -d -p 8080:8080 058107942271.dkr.ecr.us-east-1.amazonaws.com/c3-assign:latest'''
            }
        }
}
}

pipeline {
    agent {
        label 'Agent-1' //config agent in jenkins after creatin server and add the agent name here
    }
    options{
        //how much time does a snapshot need to run? max time? that we will configure here
        timeout(time: 1, unit: 'SECONDS') 
    }
    stages {
        stage('Build') {
            steps {
                sh 'echo This is build'
            }
        }
        stage('Test') {
            steps {
                sh 'echo This is test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo This is deploy'
            }
        }
    }
}
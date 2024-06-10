pipeline {
    agent {
        label 'Agent-1' //config agent in jenkins after creatin server and add the agent name here
    }
    options{
        //how much time does a snapshot need to run? max time? that we will configure here
        timeout(time: 30, unit: 'MINUTES') //we can give mints, hours, seconds etc.. 
        disableConcurrentBuilds() //Next build will wait for the previous build to get completed.
    }
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')//small word

        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')//something like paragrafh

        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')//true or false

        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')//dropdown

        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')//password
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
                sh 'sleep 10'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo This is deploy'
            }
        }
    }
}

pipeline {
    agent any
    triggers {
        upstream (
            threshold: 'SUCCESS',
            upstreamProjects: 'master'
        )
    }
    stages {
        stage('build') {
            steps {
                sh 'echo'
            }
        }
    }
}

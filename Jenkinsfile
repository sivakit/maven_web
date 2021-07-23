
pipeline {
    agent any
    triggers {
        upstream (
            threshold: 'SUCCESS',
            upstreamProjects: 'UpstreamJob\master'
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

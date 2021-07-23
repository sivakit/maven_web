import hudson.Util;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import groovy.json.JsonOutput;
import groovy.json.JsonOutput;
import groovy.json.JsonSlurper;
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

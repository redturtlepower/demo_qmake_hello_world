#!/usr/bin/env groovy

node('buildmachine_macos_ios'){
    stage('Checkout'){
        checkout scm
    }
    stage('Build'){
        withEnv([
        
        ]){
            sh 'bash build-mac.sh'
        }
    }
}

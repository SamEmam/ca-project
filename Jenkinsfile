node(''){
    stage('Welcome to our pipeline'){
        echo 'Sam, Alex and Marc bids you welcome'
    }
    stage('Preperation'){
      checkout([$class: 'GitSCM', branches: [[name: '*/ready/**']], 
      doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout'], 
      pretestedIntegration(gitIntegrationStrategy: accumulated(), integrationBranch: 'master', 
      repoName: 'origin')], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'SamEmam', 
      url: 'git@github.com:SamEmam/ca-project.git']]])

    }
    stage('Push'){
        pretestedIntegrationPublisher()

    }
    stage('Build'){
        sh 'docker build -t samemam/codedechan:latest .'
    }
    stage('open image'){
        sh 'docker run --rm -i -d -p 5000:5000 --name sampain samemam/codedechan:latest'
    }
    stage('curlCheat'){
        sh 'sleep 2'
        sh 'curl localhost:5000'
    }
    stage('close image'){
        sh 'docker stop sampain'
    }
    stage('publish'){
        withDockerRegistry(credentialsId: '58be09c9-ccdd-4375-81fd-9c3e2250170b', url: '') {
            sh 'docker push samemam/codedechan:latest'
        }   
    }
}
    
node(''){
    stage('Test'){
    sh 'docker run -i -p 5000:5000 samemam/codedechan:latest tests.py'
    }
}

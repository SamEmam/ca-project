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
        sh 'docker build . -t samemam/codedechan:latest'
    }
    stage('publish'){
        withDockerRegistry(credentialsId: 'samemam', url: "https://hub.docker.com/u/samemam/") {
            //sh 'docker login -u ${USERNAME} -p ${PASSWORD}'
            sh 'docker push samemam/decochan:latest'
        }   
    }
}
    
node(''){
    stage('Test'){
    sh 'docker run -i -p 5000:5000 samemam/codedechan:latest tests.py'
    }
}

node(''){
    stage('Welcome to our pipeline'){
        echo 'Sam, Alex and Marc bids you welcome'
    }
    stage('Preperation'){
        git credentialsId: 'SamEmam', url: 'git@github.com:SamEmam/ca-project.git'
    }
    stage ('Build'){
        sh 'docker build . -t samemam/codedechan:latest'
    }
}
    
node(''){
    stage('Test'){
    sh 'docker run -i -p 5000:5000 samemam/codedechan:latest tests.py'
    }
}

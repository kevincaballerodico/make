node('master') {
	stage('Build') {
		docker.image('kevincaballerodico/ubuntu-make').inside('-u root') {
			checkout([
            	$class: 'GitSCM', 
            	branches: [[name: '*/development']], 
            	doGenerateSubmoduleConfigurations: false, 
            	extensions: [], 
            	submoduleCfg: [], 
            	userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/kevincaballerodico/make-c.git']]
            ])

			sh 'chmod +x resources/scripts/*'
            sh 'make build'
            sh 'tree .'
		}
	}

	stage('Test') {
		docker.image('kevincaballerodico/ubuntu-valgrind').inside('-u root') {
			sh 'make valgrind'
			sh 'tree .'
		}
	}
}
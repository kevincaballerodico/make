node {
	docker.image('kevincaballerodico/ubuntu-make').inside('-u root') {
		stage('MAKE BUILD') {
			checkout([
            	$class: 'GitSCM', 
            	branches: [[name: '*/development']], 
            	doGenerateSubmoduleConfigurations: false, 
            	extensions: [], 
            	submoduleCfg: [], 
            	userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/kevincaballerodico/make-c.git']]
            ])

            sh 'cat /etc/*-release'
            sh 'make all'
            sh 'tree .'
		}
	}

	docker.image('kevincaballerodico/ubuntu-valgrind').inside('-u root') {

	}
}
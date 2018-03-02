node {
	docker.image('kevincaballerodico/ubuntu-make').inside('-u root') {
		stage('Build') {
			checkout([
            	$class: 'GitSCM', 
            	branches: [[name: '*/development']], 
            	doGenerateSubmoduleConfigurations: false, 
            	extensions: [], 
            	submoduleCfg: [], 
            	userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/kevincaballerodico/make-c.git']]
            ])

            sh 'pwd'
            sh 'make build'
            sh 'tree .'

            stash name: 'app', includes: '/bin/app'
		}
	}

	docker.image('kevincaballerodico/ubuntu-valgrind').inside('-u root') {
		unstash name: 'app'
		sh 'pwd'
		sh 'tree .'
	}
}
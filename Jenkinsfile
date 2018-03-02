node('master') {
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

            stash name: 'bin', includes: 'bin/app'
            stash name: 'objects', includes: 'objects/*.o'
		}
	}

	docker.image('kevincaballerodico/ubuntu-valgrind').inside('-u root') {
		stage('Test') {
			sh 'pwd'
			sh 'tree .'
		}
	}
}
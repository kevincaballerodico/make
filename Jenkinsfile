node {
	docker.image('kevincaballerodico/ubuntu-make').inside('-u root') {
		stage('MAKE BUILD') {
			checkout([
            	$class: 'GitSCM', 
            	branches: [[name: '*/development']], 
            	doGenerateSubmoduleConfigurations: false, 
            	extensions: [], 
            	submoduleCfg: [], 
            	userRemoteConfigs: [[credentialsId: 'github.kevin.c.dico', url: 'https://github.com/kevincaballerodico/make-c.git']]
            ])

            sh 'tree .'
		}
	}
}
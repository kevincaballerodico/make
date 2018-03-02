node('master') {
	def artifactory = Artifactory.server 'dockeroo'

	stage('Checkout') {
		checkout([
        	$class: 'GitSCM', 
        	branches: [[name: '*/development']], 
        	doGenerateSubmoduleConfigurations: false, 
        	extensions: [], 
        	submoduleCfg: [], 
        	userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/kevincaballerodico/make-c.git']]
        ])

        sh 'chmod +x resources/scripts/*'
	}

	stage('Download Artifacts') {
		def downloadSpecs = readFile 'resources/specs/download-specs.json'

		artifactory.download(downloadSpecs)

		sh 'tree .'
	}

	stage('Release Build') {
		docker.image('kevincaballerodico/ubuntu-make').inside('-u root') {
            sh 'make build'
		}
	}

	stage('Upload Artifacts') {
		def uploadSpecs = readFile 'resources/specs/upload-specs.json'

		artifactory.upload(uploadSpecs)
	}

	stage('Test') {
		docker.image('kevincaballerodico/ubuntu-valgrind').inside('-u root') {
			sh 'make valgrind'
		}

		sh 'tree .'
	}

	stage('Jenkins Artifacts') {
		archiveArtifacts artifacts: "bin/*, reports/*.xml", fingerprint: true
	}
}
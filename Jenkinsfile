pipeline {
	environment {
		DIR_SCRIPTS 	= 'resources/scripts'
		DIR_SPECS 		= 'resources/specs'
		DIR_OBJ			= 'obj'
		DIR_BUILD 		= 'build'
		DIR_TESTS 		= 'tests'
        APP 			= 'app'
        ARTIF_ID 		= 'dockeroo'
	}

	agent {
	    docker {
	        image 'kevincaballerodico/dockeroo:latest'
	        label 'master'
	        args '-u root'
	    }
	}
	
	stages {
		stage('CHECKOUT'){
	        steps {
	            checkout([
	            	$class: 'GitSCM', 
	            	branches: [[name: '*/master']], 
	            	doGenerateSubmoduleConfigurations: false, 
	            	extensions: [], 
	            	submoduleCfg: [], 
	            	userRemoteConfigs: [[credentialsId: 'github.kevin.c.dico', url: 'https://github.com/kevincaballerodico/make.git']]
	            ])
	        }
	    }

    	stage('PROVISION') {
		    steps {
		    	sh returnStdout: false, script: "bash $DIR_SCRIPTS/provision.sh"
		    }
    	}

    	stage('BUILD') {
		    steps {
		    	sh returnStdout: false, script: "bash $DIR_SCRIPTS/make-build.sh"
		    }

		    post {
	    		success {
	    			script {
						def server 		= Artifactory.server "$ARTIF_ID"
						def uploadSpec 	= readFile "$DIR_SPECS/make-props-upload.json"
						def buildInfo1 	= server.upload spec: uploadSpec
					}
	    		}
	    	}
    	}

    	stage('TEST') {
			parallel {
				stage('MEMCHECK') {
				    steps {
				    	sh returnStdout: false, script: "bash $DIR_SCRIPTS/valgrind-memcheck.sh"
				    }
		    	}

				stage('HELGRIND') {
					steps {
						sh returnStdout: false, script: "bash $DIR_SCRIPTS/valgrind-helgrind.sh"
					}
				}

				stage('DRD') {
					steps {
						sh returnStdout: false, script: "bash $DIR_SCRIPTS/valgrind-drd.sh"
					}
				}

				stage('CACHEGRIND') {
					steps {
						sh returnStdout: false, script: "bash $DIR_SCRIPTS/valgrind-cachegrind.sh"
					}
				}

				stage('CALLGRIND') {
					steps {
						sh returnStdout: false, script: "bash $DIR_SCRIPTS/valgrind-callgrind.sh"
					}
				}

				stage('MASSIF') {
					steps {
						sh returnStdout: false, script: "bash $DIR_SCRIPTS/valgrind-massif.sh"
					}
				}

				stage('LACKEY') {
					steps {
						sh returnStdout: false, script: "bash $DIR_SCRIPTS/valgrind-lackey.sh"
					}
				}
			}

			post {
				success {
					archiveArtifacts artifacts: "$DIR_BUILD/$APP, $DIR_TESTS/*.xml", fingerprint: true	
				}
			}
		}
	}
}

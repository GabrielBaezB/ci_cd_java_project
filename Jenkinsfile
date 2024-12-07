pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'ci_cd_java_project'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Build') {
            steps {
                // Asegúrate de que el script mvnw tenga permisos de ejecución
                script {
                    sh 'chmod +x mvnw'
                    sh './mvnw clean package'
                }
            }
        }

        stage('Test') {
            steps {
                // Ejecuta las pruebas unitarias usando Maven
                script {
                    sh './mvnw test'
                }
            }
        }

        stage('Docker Build') {
            steps {
                // Construye la imagen Docker
                script {
                    sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                // Inicializa y aplica Terraform
                script {
                    sh '''
                        cd terraform
                        terraform init
                        terraform apply -auto-approve
                    '''
                }
            }
        }
    }
}

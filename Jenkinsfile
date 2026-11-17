
pipeline {
    agent {
        label 'ubuntu-agent4'
    }

    parameters {
        string(
            name: 'BRANCH_NAME',
            defaultValue: 'main',
            description: 'Enter Git branch'
        )


    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: "${params.BRANCH_NAME}",
                    url: 'https://github.com/megharajbr/devops-level04.git'
            }
        }

        stage('System Information') {
            steps {
                sh '''
                    echo "==== System Information ===="
                    hostname
                    whoami
                    uptime
                    free -h
                    df -h
                    bash scripts/system_info.sh
                '''
            }
        }

       stage('Health Check') {
    steps {
        sh '''
            echo "==== HEALTH CHECK ===="
            mkdir -p logs
            cd scripts
            bash health_check.sh
        '''
    }
}
            }
        }

        stage('Disk Monitoring') {
            steps {
                sh '''
                    echo "=== DISK MONITORING ==="
                    bash scripts/disk_monitor.sh
                '''
            }
        }

        stage('Backup') {
            steps {
                sh '''
                    echo "=== BACKUP EXECUTION ==="
                    bash scripts/backup.sh
                    echo "===== Backup Files ====="
                    ls -lh backup/
                '''
            }
        }

        stage('Log Cleanup') {
            steps {
                sh '''
                    echo "==== LOG CLEANUP ===="
                    bash scripts/log_cleanup.sh
                '''
            }
        }

        stage('Archive Reports') {
            steps {
                archiveArtifacts(
                    artifacts: 'backup/*.tar.gz',
                    allowEmptyArchive: true
                )
            }
        }
    }
}

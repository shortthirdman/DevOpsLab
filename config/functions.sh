#!/bin/bash

manage_users() {
	echo "Add a new user "
	USERNAME=$1
	sudo useradd -m $USERNAME 
	sudo passwd $USERNAME
	sudo usermod -aG sudo $USERNAME
	echo "User $USERNAME added and granted sudo privileges."
}

git_auto_pull() {
	echo "Auto pulling the latest code from the Git repository"
	REPO_PATH=$1
	BRANCH=${2:-main}
	cd $REPO_PATH
	git pull origin $BRANCH
	echo "Code pulled from $BRANCH branch."
}

check_sslcert_expiry() {
	echo "Checking SSL certificate expiration"
	DOMAIN=$1
	EXPIRY_DATE=$(echo | openssl s_client -servername $DOMAIN -connect $DOMAIN:443 2>/dev/null | openssl x509 -noout -dates | grep notAfter | cut -d= -f2)
	DAYS_LEFT=$(( ($(date -d "$EXPIRY_DATE" +%s) - $(date +%s)) / 86400 ))
	echo "SSL certificate for $DOMAIN expires in $DAYS_LEFT days."
}

docker_cleanup() {
	echo "Docker container and image cleanup"
	docker system prune -af
	docker volume prune -f
	echo "Docker cleanup completed."
}

setup_sshkey() {
	echo "Generate SSH key and copy to remote server"
	REMOTE_SERVER=$1
	REMOTE_USER=$2
	ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -q -N ""
	ssh-copy-id $2@$1
	echo "SSH key setup completed."
}
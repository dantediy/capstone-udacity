create-bucket:
	aws cloudformation deploy \
	--template-file .circleci/files/frontend.yml \
	--stack-name "udapeople-frontend-bucket" \
	--parameter-overrides ID="frontend-bucket"  \
	--tags project=udapeople
			
create-ecr:
	aws cloudformation deploy \
              --template-file .circleci/files/ecr.yml \
              --tags project=udapeople \
              --region us-east-2 \
              --stack-name "udapeople-ecr" \
              --parameter-overrides RegistryName="my-ecr-capstone"
			  
update-kubeconfig:
	aws eks --region us-east-2 update-kubeconfig --name eksctl-demo

install-kubectl:
	curl -LO "https://dl.k8s.io/release/v1.24.3/bin/linux/amd64/kubectl"
	curl -LO "https://dl.k8s.io/v1.24.3/bin/linux/amd64/kubectl.sha256"
	echo "8a45348bdaf81d46caf1706c8bf95b3f431150554f47d444ffde89e8cdd712c1  kubectl" | sha256sum --check
	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
	chmod +x /usr/local/bin/kubectl


lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

build:
	docker build -t mkacz-devops-capstone .

push:
	docker login --username ${DOCKERHUB_ID} --password ${DOCKERHUB_PASSWD}
	docker tag mkacz-devops-capstone ${DOCKERHUB_ID}/mkacz-devops-capstone:${CIRCLE_SHA1}
	docker push ${DOCKERHUB_ID}/mkacz-devops-capstone:${CIRCLE_SHA1}

create-cluster:
	aws cloudformation deploy --stack-name kube-04 --template-file kubernetes-cluster.yml --capabilities CAPABILITY_IAM --parameter-overrides EnvName=kube-04 SshKeyName=udacity

connect-kubectl:
	aws eks update-kubeconfig --name ${KUBE_CLUSTER_NAME}

deploy-img-to-kube:
	kubectl create deploy mkacz-devops-capstone-${CIRCLE_SHA1} --image=${DOCKERHUB_ID}/mkacz-devops-capstone:${CIRCLE_SHA1}

del-old-deployment:
	ubectl get deployments |grep mkacz-devops-capstone|grep ${CIRCLE_SHA1} -v |awk '{print "kubectl delete deployment "$1}' |bash




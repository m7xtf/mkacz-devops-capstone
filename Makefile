

lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

build:
	docker build -t mkacz-devops-capstone .

push:
	docker tag mkacz-devops-capstone ${DOCKERHUB_ID}/mkacz-devops-capstone:${CIRCLE_SHA1}
	docker push ${DOCKERHUB_ID}/mkacz-devops-capstone:${CIRCLE_SHA1}



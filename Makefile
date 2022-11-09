

lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

build:
	docker build -t mkacz-devops-capstone .

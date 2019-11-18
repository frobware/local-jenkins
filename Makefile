build:
	docker-compose up --build

submit-jobs:
	jenkins-jobs --conf ./jenkins-jobs.ini update jobs

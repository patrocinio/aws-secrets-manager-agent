run:
	cd src; python3.9 -m flask --app run run

install:
	pip3.9 install boto3 aws_secretsmanager_caching

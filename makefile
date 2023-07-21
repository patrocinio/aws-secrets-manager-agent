run:
	go run agent.go

setup:
	-go mod init aws-secrets-manager-agent
	go get github.com/aws/aws-sdk-go-v2/aws
	go get github.com/aws/aws-sdk-go-v2/config
	go get github.com/aws/aws-sdk-go-v2/service/secretsmanager

